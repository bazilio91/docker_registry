module DockerRegistry
  module ApiV1
    class Client < DockerRegistry::Client

      def ping
        @faraday.get('/v1/_ping')
      end


      def search(query = '')
        @faraday.get('/v1/search', { q: query }).body
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


      def delete_repository_tag(repository_name, tag_name)
        @faraday\
          .delete("/v1/repositories/#{repository_name}/tags/#{tag_name}")\
          .status == 200
      end

    end
  end
end
