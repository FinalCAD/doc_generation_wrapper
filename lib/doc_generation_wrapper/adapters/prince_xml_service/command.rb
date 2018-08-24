require 'rest-client'

module DocGenerationWrapper
  module Adapter
    module PrinceXmlService
      class Command
        def create! options, &respond_callback
          headers = {}
          host    = DocGenerationWrapper.configuration.service_host
          url     = host + '/docs'

          request_parameters = DocGenerationWrapper.configuration.global_parameters.merge(options)

          request = RestClient::Request.new(method: :post, url: url, payload: request_parameters, headers: headers)
          response = request.execute
          respond_callback.call response.body
          nil
        end
      end
    end
  end
end
