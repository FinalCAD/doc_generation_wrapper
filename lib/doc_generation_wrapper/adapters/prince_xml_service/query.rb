require 'rest-client'

module DocGenerationWrapper
  module Adapter
    module PrinceXmlService

      class Query

        def status status_id
          data    = { id: JSON.parse(status_id)['status_id'] }
          headers = {}
          host    = DocGenerationWrapper.configuration.service_host
          url     = host + '/status'

          request = RestClient::Request.new(method: :get, url: url, payload: data, headers: headers)
          response = request.execute

          JSON.parse(response)
        end

      end
    end
  end
end
