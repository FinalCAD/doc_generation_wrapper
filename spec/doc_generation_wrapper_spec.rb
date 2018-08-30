require 'spec_helper'
require 'docraptor'

module DocGenerationWrapper

  describe Wrapper do
    let(:wrapper) { Wrapper.new }
    let(:adapter) { :doc_raptor }

    before do
      DocGenerationWrapper.configure do |config|
        config.adapter = adapter
      end
    end

    describe '#create!' do
      let(:options) {{
        async: true,
        document_type: :odf,
        javascript: false,
        pipeline: 6,
        test: true,
        prince_xml: {
          baseurl: nil,
          media: :print,
          javascript: false
        }
      }}

      before do
        doc_raptor_double = double
        expect(doc_raptor_double).to receive(:create_async_doc).with(options)
        expect(DocRaptor::DocApi).to receive(:new) { doc_raptor_double }
      end

      specify do
        wrapper.create! options
      end
    end

    describe '#status' do
      let(:id) { :id }

      before do
        doc_raptor_double = double
        expect(doc_raptor_double).to receive(:get_async_doc_status).with(id)
        expect(DocRaptor::DocApi).to receive(:new) { doc_raptor_double }
      end

      specify do
        wrapper.status id
      end
    end
  end
end
