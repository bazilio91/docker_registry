module DockerRegistry
  module ApiV1
    class Repository < DockerRegistry::Repository

      def initialize(registry, metadata = {})
        @registry = registry
        @metadata = {}
        metadata.each do |key, val|
          @metadata[key.to_sym] = val
        end
        @name = @metadata[:name]
      end

    end
  end
end
