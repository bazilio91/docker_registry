require 'uri'

module DockerRegistry
  class Registry

    attr_reader :base_uri, :options, :client

    # @see DockerRegistry::Client#initialize
    def initialize(uri, api_version = 'v1')
      @uri = URI.parse(uri)
      @client = DockerRegistry::Client.build(
        "#{@uri.scheme}://#{@uri.host}:#{@uri.port}",
        api_version,
        user: @uri.user,
        password: @uri.password
      )
    end


    def domain
      @domain ||= @uri.host
    end


    def ping
      @client.ping
    end


    def all
      search
    end


    def search(query = '')
      (@client.search(query)['results'] || []).map do |repo|
        DockerRegistry::Repository.new(repo, self)
      end
    end


    def [](name)
      DockerRegistry::Repository.new({ name: name }, self)
    end


    def repository_tags(repository)
      (@client.repository_tags(repository.name) || {}).map do |name, image_id|
        DockerRegistry::Tag.new(name, image_id, repository)
      end
    end


    def repository_tag(repository, tag)
      image_id = (@client.repository_tag(repository.name, tag) || "")
      DockerRegistry::Tag.new(tag, image_id, repository)
    end


    def delete_repository(repository)
      @client.delete_repository(repository.name)
    end


    def delete_repository_tag(tag)
      @client.delete_repository_tag(tag.repository.name, tag.name)
    end


    def get_image(image_id)
      meta = @client.get_image(image_id) || {}
      DockerRegistry::Image.new(meta)
    end


    def alive?
      @client.alive?
    end

  end
end
