require 'uri'

module DockerRegistry
  class Registry

    attr_reader :domain
    attr_reader :client


    def initialize(uri, client)
      @domain = uri.host
      @client = client
    end


    class << self

      def build(uri, api_version)
        uri = URI.parse(uri)
        case api_version
        when 'v1'
          DockerRegistry::ApiV1::Registry.new(uri, get_client(uri, api_version))
        when 'v2'
          DockerRegistry::ApiV2::Registry.new(uri, get_client(uri, api_version))
        end
      end


      def get_client(uri, api_version)
        options = { user: uri.user, password: uri.password }
        parsed_uri = "#{uri.scheme}://#{uri.host}:#{uri.port}"
        case api_version
        when 'v1'
          DockerRegistry::ApiV1::Client.new(parsed_uri, options)
        when 'v2'
          DockerRegistry::ApiV2::Client.new(parsed_uri, options)
        end
      end

    end


    def alive?
      @client.alive?
    end


    def [](name)
      find_repository(name)
    end


    def find_repository(name)
      repo = search(repository: name)
      if repo.empty?
        raise ::DockerRegistry::Errors::RepositoryNotFound, "Repository not found : '#{name}'"
      else
        repo.first
      end
    end


    def repositories
      search
    end


    def search(opts = {})
      raise NotImplementedError
    end


    def repository_tags(repository)
      raise NotImplementedError
    end


    def repository_tag(repository, name)
      raise NotImplementedError
    end


    def delete_repository(repository)
      raise NotImplementedError
    end


    def delete_repository_tag(repository, tag)
      raise NotImplementedError
    end

  end
end
