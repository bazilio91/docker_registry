module DockerRegistry
  module Client
    extend self

    def build(base_uri, api_version, options = {})
      case api_version
      when 'v1'
        DockerRegistry::Client::ApiV1.new(base_uri, options)
      when 'v2'
        DockerRegistry::Client::ApiV2.new(base_uri, options)
      end
    end

  end
end
