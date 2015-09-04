module DockerRegistry
  module Client
    class ApiV2 < Base

      def ping
        @faraday.get('/v2/')
      end


      def search(query = '')
        @faraday.get('/v1/search', { q: query }).body
      end


      def repository_tags(name)

      end


      def repository_tag(name, tag)

      end


      def delete_repository(name)

      end


      def delete_repository_tag(repository_name, tag_name)

      end


      def get_image(image_id)

      end

    end
  end
end
