require 'spec_helper'

module DocGenerationWrapper
  describe Configuration do
    let(:configuration) { Configuration.new }

    describe 'default config' do
      let(:adapter)      { :doc_raptor }
      let(:service_host) { 'http://0.0.0.0:5000' }

      it 'adapter is doc_raptor' do
        expect(configuration.adapter).to eq(adapter)
      end

      it 'service host is local sinatra hosting' do
        expect(configuration.service_host).to eq(service_host)
      end
    end

  end
end
