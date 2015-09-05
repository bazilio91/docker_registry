module DockerRegistry
  module ApiV2
    class Client < DockerRegistry::Client

      def ping
        @faraday.get('/v2/')
      end


      def search(opts = {})
        @faraday.get('/v2/_catalog', opts).body
      end


      def repository_tags(name)
        @faraday.get("/v2/#{name}/tags/list").body
      end


      def repository_tag(name, tag)
        @faraday.get("/v2/#{name}/manifests/#{tag}").body
      end

    end
  end
end
