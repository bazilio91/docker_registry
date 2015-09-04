module DockerRegistry
  class Tag

    attr_reader :name, :image_id, :repository

    def initialize(name, image_id, repository)
      @name       = name
      @image_id   = image_id
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


    def infos
      registry.get_image(image_id)
    end


    def delete!
      registry.delete_repository_tag(self)
    end


    def inspect
      "#<DockerRegistry::Tag #{full_name}>"
    end

  end
end
