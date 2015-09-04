module DockerRegistry
  module ApiV2
    class Repository < DockerRegistry::Repository

      def initialize(registry, name)
        @registry = registry
        @name     = name
      end

    end
  end
end
