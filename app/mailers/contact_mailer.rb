class ContactMailer < ApplicationMailer
  def self.contact_to
    ENV["CONTACT_TO_EMAIL"].presence
  end

  def self.contact_from
    ENV["CONTACT_FROM_EMAIL"].presence || "no-reply@example.com"
  end

  def self.subject_prefix
    ENV["CONTACT_SUBJECT_PREFIX"].presence || "[Contact]"
  end

  def contact_email(name:, email:, message:)
    @name = name
    @email = email
    @message = message

    mail(
      to: self.class.contact_to,
      from: self.class.contact_from,
      reply_to: email,
      subject: "#{self.class.subject_prefix} New message from #{name}"
    )
  end
end
