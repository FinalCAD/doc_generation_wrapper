require_relative 'abstract'
require_relative 'implementation'
require_relative 'doc_raptor_service/proxy'
require_relative 'doc_raptor_service/command'
require_relative 'doc_raptor_service/query'

require 'doc_raptor'

module DocGenerationWrapper
  module Adapter
    class DocRaptorAdapter < Abstract
      include Implementation

      def create! options
        DocRaptorService::Command.new.create! options
      end

      def status status_id
        DocRaptorService::Query.new.status status_id
      end

    end
  end
end
