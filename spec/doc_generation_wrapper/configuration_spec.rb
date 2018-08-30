require 'spec_helper'

module DocGenerationWrapper
  describe Configuration do
    describe 'default config' do
      let(:configuration) { Configuration.new }
      let(:doc_raptor) { configuration.doc_raptor }
      let(:prince_xml) { configuration.prince_xml }

      let(:adapter)               { :doc_raptor }
      let(:async)                 { false }
      let(:baseurl)               { nil }
      let(:doc_raptor_javascript) { false }
      let(:document_type)         { :pdf }
      let(:media)                 { :print }
      let(:pipeline)              { 6 }
      let(:prince_xml_javascript) { false }
      let(:service_host)          { 'http://0.0.0.0:5000' }
      let(:test)                  { false }

      its 'adapter is doc_raptor' do
        expect(configuration.adapter).to eq(adapter)
      end

      its 'service host is local sinatra hosting' do
        expect(configuration.service_host).to eq(service_host)
      end

      describe 'doc raptor config' do
        its 'async is false' do
          expect(doc_raptor.async).to eq(async)
        end

        its 'javascript options is false' do
          expect(doc_raptor.javascript).to eq(doc_raptor_javascript)
        end

        its 'document_type is :pdf' do
          expect(doc_raptor.document_type).to eq(document_type)
        end

        its 'pipeline is 6' do
          expect(doc_raptor.pipeline).to eq(pipeline)
        end

        its 'test is false' do
          expect(doc_raptor.test).to eq(test)
        end
      end

      describe 'prince xml config' do
        its 'baseurl is nil' do
          expect(prince_xml.baseurl).to eq(baseurl)
        end

        its 'media is :screen' do
          expect(prince_xml.media).to eq(media)
        end

        its 'javascript option is false' do
          expect(prince_xml.javascript).to eq(prince_xml_javascript)
        end
      end
    end

    describe 'non default config' do
      let(:configuration) { Configuration.new }

      let(:async)                 { true }
      let(:baseurl)               { 'b.com' }
      let(:doc_raptor_javascript) { true }
      let(:document_type)         { :xls }
      let(:media)                 { :screen }
      let(:pipeline)              { 4 }
      let(:prince_xml_javascript) { true }
      let(:test)                  { true }

      before do
        configuration.doc_raptor.async = true
        configuration.doc_raptor.document_type = :xls
        configuration.doc_raptor.javascript = true
        configuration.doc_raptor.pipeline = 4
        configuration.doc_raptor.test = true
        configuration.prince_xml.baseurl = 'b.com'
        configuration.prince_xml.javascript = true
        configuration.prince_xml.media = :screen
      end

      describe 'doc raptor config' do
        its 'async is true' do
          expect(configuration.doc_raptor.async).to eq(async)
        end

        its 'javascript options is true' do
          expect(configuration.doc_raptor.javascript).to eq(doc_raptor_javascript)
        end

        its 'document_type is :xls' do
          expect(configuration.doc_raptor.document_type).to eq(document_type)
        end

        its 'pipeline is 4' do
          expect(configuration.doc_raptor.pipeline).to eq(pipeline)
        end

        its 'test is false' do
          expect(configuration.doc_raptor.test).to eq(test)
        end
      end

      describe 'prince xml config' do
        its 'baseurl is b.com' do
          expect(configuration.prince_xml.baseurl).to eq(baseurl)
        end

        its 'media is :print' do
          expect(configuration.prince_xml.media).to eq(media)
        end

        its 'javascript option is true' do
          expect(configuration.prince_xml.javascript).to eq(prince_xml_javascript)
        end
      end
    end
  end
end
