module DockerRegistry
  class Tag

    attr_reader :name, :repository

    def initialize(name, repository)
      @name       = name
      @repository = repository
    end


    def to_s
      full_name
    end


    def full_name
      "#{repository_name}:#{name}"
    end


    def repository_name
      @repository.name
    end


    def path
      full_name
    end


    def registry
      @repository.registry
    end


    def delete!
      registry.delete_repository_tag(self)
    end


    def inspect
      "#<DockerRegistry::Tag #{full_name}>"
    end

  end
end
