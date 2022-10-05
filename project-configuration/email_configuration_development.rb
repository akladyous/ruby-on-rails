    config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

    config.action_mailer.raise_delivery_errors = false
    config.action_mailer.perform_caching = false
    config.action_mailer.default_url_options = { host: Rails.application.credentials.dig(:email_provider, :host) }
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.perform_caching = false
    config.action_mailer.perform_deliveries = true
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
    address:              Rails.application.credentials.dig(:email_provider, :address),
    port:                 Rails.application.credentials.dig(:email_provider, :port),
    domain:               Rails.application.credentials.dig(:email_provider, :domain),
    user_name:            Rails.application.credentials.dig(:email_provider, :user),
    password:             Rails.application.credentials.dig(:email_provider, :password),
    authentication:       'plain',
    enable_starttls_auto: true,
    open_timeout:         5,
    read_timeout:         5 }

