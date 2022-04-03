module Api
  module V1
    class BaseController
      def error_response(status, error_messages)
        status = Rack::Utils::SYMBOL_TO_STATUS_CODE[status] if status.instance_of? Symbol
        errors = if error_messages.is_a?(ActiveRecord::Base)
                   ErrorSerializer.from_model(status, error_messages)
                 else
                   ErrorSerializer.from_messages(status, error_messages)
                 end
        json errors
      end
    end
  end
end
