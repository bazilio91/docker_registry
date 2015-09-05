module DockerRegistry
  module ApiV1
    class Client < DockerRegistry::Client

      def ping
        @faraday.get('/v1/_ping')
      end


      def search(opts = {})
        @faraday.get('/v1/search', opts).body
      end


      def repository_tags(name)
        @faraday.get("/v1/repositories/#{name}/tags").body
      end


      def repository_tag(name, tag)
        @faraday.get("/v1/repositories/#{name}/tags/#{tag}").body
      end


      def delete_repository(name)
        @faraday.delete("/v1/repositories/#{name}/").status == 200
      end


      def delete_repository_tag(name, tag)
        @faraday.delete("/v1/repositories/#{name}/tags/#{tag}").status == 200
      end

    end
  end
end
