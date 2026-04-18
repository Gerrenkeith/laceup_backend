class Users::RegistrationsController < Devise::RegistrationsController
  include RackSessionsFix
  respond_to :json
  private

  def respond_with(resource, _opts = {})
    if resource.persisted?
      # We check for the serializer; if it fails, we fall back to standard JSON
      user_data = begin
                    UserSerializer.new(resource).serializable_hash[:data][:attributes]
                  rescue
                    resource.as_json(only: [:id, :email, :username, :first_name, :last_name])
                  end

      render json: {
        status: { code: 200, message: 'Signed up successfully.' },
        data: user_data
      }, status: :ok
    else
      render json: {
        status: { message: "User couldn't be created successfully. #{resource.errors.full_messages.to_sentence}" }
      }, status: :unprocessable_entity
    end
  end
end
