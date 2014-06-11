module DocGenerationWrapper
  module Adapter
    class Base

      class UnsupportedAdapter < StandardError ; end

      def self.create adapter_name
        load "doc_generation_wrapper/adapters/#{adapter_name}_adapter.rb"
        DocGenerationWrapper::Adapter.const_get(klass_adapter(adapter_name)).new
      end

      private

      def self.klass_adapter adapter_symbol
        case adapter_symbol
        when :doc_raptor then :DocRaptorAdapter
        when :prince_xml then :PrinceXmlAdapter
        else raise UnsupportedAdapter.new
        end
      end

    end
  end
end
