module ExceptionRescueHelper
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid,  with: :record_invalid
    rescue_from Exceptions::ParamsMissingError, with: :invalid_params

    private

    def record_invalid(exception)
      render json: { errors: exception&.record&.errors, error: exception.message }, status: :unprocessable_entity
    end

    def invalid_params(exception)
      render json: { error: exception.message.humanize }, status: :bad_request
    end
  end
end
