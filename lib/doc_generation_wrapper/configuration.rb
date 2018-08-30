module DocGenerationWrapper
  # Simple class to allow configuration of various components of the wrappers.
  #
  # All the properties of docraptor and prince xml are allowed to be configured.
  # These properties have a default value matching those of DocRaptor's documentation.
  # For details, see https://docraptor.com/documentation/api
  class Configuration
    attr_accessor :adapter, :service_host, :doc_raptor, :prince_xml

    def initialize
      @adapter = :doc_raptor
      @doc_raptor = DocRaptor.new
      @prince_xml = PrinceXML.new
      @service_host = 'http://0.0.0.0:5000'
    end

    # Returns the settings of DocRaptor and PrinceXML as a hash of parameters
    # to be passed to the HTTP client for making queries.
    #
    # It already handles the expected formatting of DocRaptor API (DocRaptor options at the base and
    # PrinceXML as multipart parameters).
    def global_parameters
      {
        async: doc_raptor.async,
        document_type: doc_raptor.document_type,
        javascript: doc_raptor.javascript,
        pipeline: doc_raptor.pipeline,
        test: doc_raptor.test,
        prince_xml: {
          baseurl: prince_xml.baseurl,
          media: prince_xml.media,
          javascript: prince_xml.javascript
        }
      }
    end

    # Configuration pertaining to DocRaptor.
    #
    # Allowed Parameters :
    # - `pipeline`: DocRaptor's pipeline version. Refer to DocRaptor's docs for differences between versions.
    #               Default : `6`.
    # - `document_type`: The type of the document.
    #                    Default : `:pdf`
    # - `async`: Whether to run the generation asyncronously or syncronously.
    #            Default : `true`
    # - `javascript`: Use DocRaptor's JS engine or don't.
    #                 Note : The version of the JS engine is determined by the pipeline version.
    #                 Default : `false`
    # - `test`: Whether to generate the document in test mode or in normal mode.
    #           Note : in test mode, documents get a watermark and Excel docs are limited to 20 rows.
    #           Default : `false`
    class DocRaptor
      attr_accessor :async, :document_type, :javascript, :pipeline, :test

      def initialize
        @async         = false
        @document_type = :pdf
        @javascript    = false
        @pipeline      = 6
        @test          = false
      end
    end

    # Configuration pertaining to PrinceXML.
    # Disregarded most of the options, as they're not that useful in 90% of cases.
    #
    # Allowed parameters :
    # - `baseurl`: The base url for fetching assets (only relevant for relative paths)
    #              Default : `nil`
    # - `media`: The type of media the document is expected to be viewed on.
    #            Default : `:print`
    # - `javascript`: Whether to use PrinceXML's JS engine.
    #                 Default : `false`
    # - `http_timeout`: How long to wait when requesting external resources.
    #                   Value can be from 1 to 60 in seconds.
    #                   Default : `10`
    class PrinceXML
      attr_accessor :baseurl, :http_timeout, :javascript, :media

      def initialize
        @baseurl = nil
        @http_timeout = 10
        @javascript = false
        @media   = :print
      end
    end
  end
end
