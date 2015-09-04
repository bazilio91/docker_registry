module DockerRegistry
  module ApiV2
    class Client < DockerRegistry::Client

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

    end
  end
end
