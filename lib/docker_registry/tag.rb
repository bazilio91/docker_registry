module DockerRegistry
  class Tag

    attr_reader :name, :repository

    def initialize(name, repository)
      @name       = name
      @repository = repository
    end


    def to_s
      path
    end


    def path
      "#{repository.name}:#{name}"
    end


    def full_path
      "#{repository.full_name}:#{name}"
    end


    def delete!
      registry.delete_repository_tag(repository, self)
    end


    def inspect
      "#<DockerRegistry::Tag #{path}>"
    end


    private


      def registry
        @repository.registry
      end

  end
end
