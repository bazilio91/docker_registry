module DockerRegistry
  class Repository

    attr_reader :name, :metadata, :registry

    def initialize(metadata, registry)
      @metadata = {}
      metadata.each_pair do |key, val|
        @metadata[key.to_sym] = val
      end
      @name = @metadata[:name]
      @registry = registry
    end


    def to_s
      full_name
    end


    def full_name
      "#{registry.domain}/#{name}"
    end


    def tags
      registry.repository_tags(self)
    end


    def [](tag)
      registry.repository_tag(self, tag)
    end


    def delete!
      registry.delete_repository(self)
    end


    def inspect
      "#<DockerRegistry::Repository #{full_name} >"
    end

  end
end
