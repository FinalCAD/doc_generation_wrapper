require 'spec_helper'

module DocGenerationWrapper
  describe Configuration do
    let(:configuration) { Configuration.new }

    describe '#adapter' do
      let(:adapter) { :doc_raptor }

      it 'the default is doc_raptor' do
        expect(configuration.adapter).to eq(adapter)
      end
    end

  end
end
