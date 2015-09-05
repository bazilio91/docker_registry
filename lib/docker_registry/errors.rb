module DockerRegistry
  module Errors

    class DockerRegistryException < StandardError; end
    class TagNotFound < DockerRegistryException; end
    class RepositoryNotFound < DockerRegistryException; end

  end
end
