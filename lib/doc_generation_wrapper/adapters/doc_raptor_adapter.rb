require_relative 'abstract'

require_relative 'doc_raptor_service/command'
require_relative 'doc_raptor_service/query'

DocRaptor.configure do |dr|
  dr.username  = ENV['DOCRAPTOR_API_KEY'] # "YOUR_API_KEY_HERE" # this key works for test documents
  # dr.debugging = true
end

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
