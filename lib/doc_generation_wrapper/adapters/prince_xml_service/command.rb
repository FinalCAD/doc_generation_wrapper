require 'rest-client'

module DocGenerationWrapper
  module Adapter
    module PrinceXmlService

      class Command

        def create! options, &respond_callback
          headers = {}
          host    = DocGenerationWrapper.configuration.service_host
          url     = host + '/docs'

          request = RestClient::Request.new(method: :post, url: url, payload: options, headers: headers)
          response = request.execute
          respond_callback.call response.body

          nil
        end

      end
    end
  end
end
