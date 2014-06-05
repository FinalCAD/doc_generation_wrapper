module DocGenerationWrapper
  module Adapter
    module DocRaptor

      class Command

        def create! options
          Proxy.create! options
        end

      end
    end
  end
end
