module DockerRegistry
  module ApiV1
    class Repository < DockerRegistry::Repository

      def initialize(registry, metadata = {})
        @registry = registry
        @name     = metadata.delete('name')
        @metadata = {}
        metadata.each do |key, val|
          @metadata[key.to_sym] = val
        end
      end

    end
  end
end
