# Preview all emails at http://localhost:3000/rails/mailers/contact_me_notification_mailer
class ContactMeNotificationMailerPreview < ActionMailer::Preview
    def sample_notification
        mailer = ContactMeNotificationMailer.contact_email("John Doe", "john.doe@example.com", "Test Subject", "This is a test message")
    end
end
