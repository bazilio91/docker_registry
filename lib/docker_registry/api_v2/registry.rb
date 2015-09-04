module DockerRegistry
  module ApiV2
    class Registry < DockerRegistry::Registry

      def search(query = '')
        (@client.search(query)['repositories'] || []).map do |repo|
          Repository.new(self, repo)
        end
      end


      def repository_tags(repository)
        (@client.repository_tags(repository.name)['tags'] || []).map do |name|
          DockerRegistry::Tag.new(name, repository)
        end
      end

    end
  end
end
