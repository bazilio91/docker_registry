module DockerRegistry
  module ApiV1
    class Registry < DockerRegistry::Registry

      def search(query = '')
        (@client.search(query)['results'] || []).map do |repo|
          Repository.new(self, repo)
        end
      end


      def repository_tags(repository)
        (@client.repository_tags(repository.name) || {}).map do |name, _|
          DockerRegistry::Tag.new(name, repository)
        end
      end

    end
  end
end
