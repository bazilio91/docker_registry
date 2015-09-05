module DockerRegistry
  module ApiV1
    class Registry < DockerRegistry::Registry

      def search(opts = {})
        query = build_query(opts)
        results = (@client.search(query)['results'] || []).map { |repo| Repository.new(self, repo) }
        results.sort_by(&:name)
      end


      def repository_tags(repository)
        results = (@client.repository_tags(repository.name) || {}).map { |name, _| DockerRegistry::Tag.new(name, repository) }
        results.sort_by(&:name)
      end


      def repository_tag(repository, name)
        response = @client.repository_tag(repository.name, name)
        if response.is_a?(Hash) && response['error']
          raise ::DockerRegistry::Errors::TagNotFound, "#{response['error']} : '#{name}'"
        elsif response.is_a?(String)
          DockerRegistry::Tag.new(name, repository)
        end
      end


      def delete_repository(repository)
        @client.delete_repository(repository.name)
      end


      def delete_repository_tag(repository, tag)
        @client.delete_repository_tag(repository.name, tag.name)
      end


      private


        def build_query(opts = {})
          return {} if opts.empty?
          if opts[:repository]
            { q: opts[:repository] }
          else
            {}
          end
        end

    end
  end
end
