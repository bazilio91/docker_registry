module DockerRegistry
  module Client
    class ApiV1 < Base

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


      def get_image(image_id)
        @faraday.get("/v1/images/#{image_id}/json").body
      end

    end
  end
end
