require 'spec_helper'
require 'doc_raptor'

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
      let(:options) {{}}

      before do
        expect(DocRaptor).to receive(:create!).with(options)
      end

      specify do
        wrapper.create! options
      end
    end

    describe '#status' do
      let(:id) { :id }

      before do
        expect(DocRaptor).to receive(:status).with(id, true)
      end

      specify do
        wrapper.status id
      end
    end
  end
end
