# Email Notification App

A simple Ruby on Rails application for handling contact form submissions and sending email notifications using Mailgun.

> **Note:** This app does **not** use a database. It is designed for lightweight use cases such as static sites or serverless contact forms.

## Features

- Contact form submission handling
- Sends email notifications via Mailgun SMTP
- Secure: sensitive data (like email) is filtered from logs
- Clean, modern HTML email templates
- No database required

## Requirements

- **Ruby:** (e.g., 3.2.x)
- **Rails:** (e.g., 7.x)
- **Mailgun** account (for sending emails)

## Getting Started

### 1. Clone the repository
```sh
git clone https://github.com/yourusername/emailnotification.git
cd emailnotification
```

### 2. Install dependencies
```sh
bundle install
```

### 3. Configure environment variables
Create a `.env` file in the project root (or set these variables in your environment):
```
SMTP_ADDRESS=smtp.mailgun.org
SMTP_PORT=587
SMTP_DOMAIN=your_mailgun_domain
SMTP_USERNAME=your_mailgun_username
SMTP_PASSWORD=your_mailgun_password
```

You can use the [dotenv-rails](https://github.com/bkeepers/dotenv) gem for local development to load these automatically.

### 4. Start the Rails server
```sh
rails server
```

### 5. Access the app
Open [http://localhost:3000](http://localhost:3000) in your browser.

## How It Works
- The app receives contact form submissions (see `app/controllers/contact_me_notification_controller.rb`).
- It sends an email using Mailgun SMTP (see `app/mailers/contact_me_notification_mailer.rb`).
- Email templates are in `app/views/contact_me_notification_mailer/`.
- Sensitive fields like `email` are filtered from logs (see `config/initializers/filter_parameter_logging.rb`).

## Testing
Run the test suite with:
```sh
rails test
```

## Deployment
- Set all required environment variables in your production environment.
- No database setup is needed.

## Security Notes
- **Never log sensitive data directly.**
- All credentials and secrets should be managed via environment variables.

## License

This project is licensed under the MIT License.
