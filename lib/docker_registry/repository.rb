module DockerRegistry
  class Repository

    attr_reader :name, :registry


    def to_s
      name
    end


    def full_name
      "#{registry.domain}/#{name}"
    end


    def tags
      registry.repository_tags(self)
    end


    def [](tag)
      find_tag(tag)
    end


    def find_tag(tag)
      registry.repository_tag(self, tag)
    end


    def delete!
      registry.delete_repository(self)
    end


    def inspect
      "#<DockerRegistry::Repository #{full_name}>"
    end

  end
end
