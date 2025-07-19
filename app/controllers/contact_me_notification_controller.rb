class ContactMeNotificationController < ApplicationController
    skip_before_action :verify_authenticity_token  # Required for external POSTs
    def getMessage
        begin
            payload = JSON.parse(request.body.read)
            pubsub_message = payload["message"]
            decoded_data = Base64.decode64(pubsub_message["data"])
            message_object = JSON.parse(decoded_data)
            Rails.logger.info("Received payload: #{decoded_data}")
            fullName = message_object["fullName"]
            email = message_object["sender"]
            subject = message_object["subject"]
            messageText = message_object["message"]
            ContactMeNotificationMailer.contact_email(fullName, email, subject, messageText).deliver_now
            render json: {
            status: "success",
            message: "Message sent successfully"
            }, status: :ok
        rescue JSON::ParserError, ArgumentError => e
            Rails.logger.error("[ContactMeNotification] Parsing error: #{e.message}")
            render json: { error: "Invalid request format." }, status: :bad_request
        
        rescue StandardError => e
            Rails.logger.error("[ContactMeNotification] Unexpected error: #{e.message}")
            render json: { error: "An unexpected error occurred." }, status: :internal_server_error
        end  
    end
end
