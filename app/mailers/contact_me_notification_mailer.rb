class ContactMeNotificationMailer < ApplicationMailer
    default to: 'jijodaniel2017@gmail.com'
    def contact_email(fullName, email, subject, messageText)
        @fullName = fullName
        @email = email
        @subject = subject
        @messageText = messageText
        mail(from: "jijodaniel2025@gmail.com", subject: subject)
    end
end
