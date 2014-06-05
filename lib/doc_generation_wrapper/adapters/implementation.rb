module DocGenerationWrapper
  module Adapter
    module Implementation

      def create! options
        adapter.create! options
      end

      def status status_id
        adapter.status status_id
      end

    end
  end
end
