smtp_address = ENV["SMTP_ADDRESS"]

if smtp_address.present?
  smtp_settings = {
    address: smtp_address,
    port: (ENV["SMTP_PORT"] || 587).to_i,
    domain: ENV["SMTP_DOMAIN"],
    user_name: ENV["SMTP_USERNAME"],
    password: ENV["SMTP_PASSWORD"],
    authentication: ENV["SMTP_AUTHENTICATION"]&.to_sym,
    enable_starttls_auto: ENV.fetch("SMTP_ENABLE_STARTTLS_AUTO", "true") == "true"
  }.compact

  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = smtp_settings
end
