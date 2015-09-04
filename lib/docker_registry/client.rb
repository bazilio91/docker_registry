require 'faraday'
require 'faraday_middleware'

module DockerRegistry
  class Client

    # @param [#to_s] base_uri Docker registry base URI
    # @param [Hash] options Client options
    # @option options [#to_s] :user User name for basic authentication
    # @option options [#to_s] :password Password for basic authentication
    #
    def initialize(base_uri, options = {})
      @base_uri = base_uri.to_s
      @faraday = Faraday.new(@base_uri) do |builder|
        builder.request :json
        builder.use DockerRegistry::OjParser, content_type: /\bjson$/

        if options[:user] && options[:password]
          builder.request(
            :basic_auth,
            options[:user].to_s, options[:password].to_s
          )
        end

        builder.adapter :net_http
      end
    end


    def alive?
      ping.status == 200
    end


    def ping
      raise NotImplementedError
    end


    def search(query = '')
      raise NotImplementedError
    end


    def repository_tags(name)
      raise NotImplementedError
    end


    def repository_tag(name, tag)
      raise NotImplementedError
    end


    def delete_repository(name)
      raise NotImplementedError
    end


    def delete_repository_tag(repository_name, tag_name)
      raise NotImplementedError
    end

  end
end
