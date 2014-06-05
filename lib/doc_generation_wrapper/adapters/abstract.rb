module DocGenerationWrapper
  module Adapter
    class Abstract

      def create! options
        raise NotImplementedError
      end

      def status status_id
        raise NotImplementedError
      end

    end
  end
end
