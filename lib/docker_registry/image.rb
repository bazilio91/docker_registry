module DockerRegistry
  class Image

    def initialize(metadata = {})
      metadata.each do |key, val|
        instance_variable_set( "@#{key.downcase}", val)
      end
    end


    def id
      @id
    end


    def parent
      @parent
    end


    def created_at
      DateTime.parse @created
    end


    def container
      @container
    end


    def container_config
      @container_config
    end


    def docker_version
      @docker_version
    end


    def author
      @author
    end


    def config
      @config
    end


    def architecture
      @architecture
    end


    def os
      @os
    end


    def size
      @size
    end

  end
end
