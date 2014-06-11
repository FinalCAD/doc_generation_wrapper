require_relative 'abstract'

require_relative 'prince_xml_service/command'
require_relative 'prince_xml_service/query'

module DocGenerationWrapper
  module Adapter
    class PrinceXmlAdapter < Abstract

      def create! options, &respond_callback
        PrinceXmlService::Command.new.create! options, &respond_callback
      end

      def status status_id
        PrinceXmlService::Query.new.status status_id
      end

    end
  end
end
