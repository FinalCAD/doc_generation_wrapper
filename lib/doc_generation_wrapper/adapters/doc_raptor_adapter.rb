require_relative 'abstract'

require_relative 'doc_raptor_service/proxy'
require_relative 'doc_raptor_service/command'
require_relative 'doc_raptor_service/query'

module DocGenerationWrapper
  module Adapter
    class DocRaptorAdapter < Abstract

      def create! options, &respond_callback
        DocRaptorService::Command.new.create! options, &respond_callback
      end

      def status status_id
        DocRaptorService::Query.new.status status_id
      end

    end
  end
end
