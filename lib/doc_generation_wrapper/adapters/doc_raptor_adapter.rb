require_relative 'abstract'
require_relative 'implementation'
require_relative 'doc_raptor/proxy'
require_relative 'doc_raptor/command'
require_relative 'doc_raptor/query'

require 'doc_raptor'

module DocGenerationWrapper
  module Adapter
    class DocRaptorAdapter < Abstract
      include Implementation

      def create! options
        DocRaptor::Command.new.create! options
      end

      def status status_id
        DocRaptor::Query.new.status status_id
      end

    end
  end
end
