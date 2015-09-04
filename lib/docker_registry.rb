module DockerRegistry
  require 'docker_registry/client'
  require 'docker_registry/image'
  require 'docker_registry/oj_parser'
  require 'docker_registry/registry'
  require 'docker_registry/repository'
  require 'docker_registry/tag'
  require 'docker_registry/version'

  require 'docker_registry/api_v1/client'
  require 'docker_registry/api_v1/registry'
  require 'docker_registry/api_v1/repository'

  require 'docker_registry/api_v2/client'
  require 'docker_registry/api_v2/registry'
  require 'docker_registry/api_v2/repository'
end
