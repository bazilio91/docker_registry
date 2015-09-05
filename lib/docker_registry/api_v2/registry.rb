module DockerRegistry
  module ApiV2
    class Registry < DockerRegistry::Registry

      def search(opts = {})
        query = build_query(opts)
        results = (@client.search(query)['repositories'] || []).map { |repo| Repository.new(self, repo) }
        if opts[:repository]
          results.select { |r| r.name == opts[:repository] }
        else
          results
        end
      end


      def repository_tags(repository)
        (@client.repository_tags(repository.name)['tags'] || []).map { |name| DockerRegistry::Tag.new(name, repository) }
      end


      def repository_tag(repository, name)
        response = @client.repository_tag(repository.name, name)
        if response['errors']
          raise ::DockerRegistry::Errors::TagNotFound, "Tag not found : '#{name}'"
        else
          DockerRegistry::Tag.new(name, repository)
        end
      end


      private


        def build_query(opts = {})
          {}
        end

    end
  end
end
