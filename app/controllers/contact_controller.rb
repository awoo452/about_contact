class ContactController < ApplicationController
  def new
    load_contact_content
    @form_data = {}
  end

  def create
    load_contact_content
    @form_data = contact_params.to_h

    if missing_required_fields?
      flash.now[:alert] = "Name, email, and message are required."
      render :new, status: :unprocessable_entity
      return
    end

    unless ContactMailer.contact_to.present?
      flash.now[:alert] = "Email is not configured. Set CONTACT_TO_EMAIL to enable delivery."
      render :new, status: :unprocessable_entity
      return
    end

    ContactMailer.contact_email(**@form_data.symbolize_keys).deliver_later
    redirect_to contact_path, notice: "Message sent."
  end

  private

  def load_contact_content
    @contact = site_content.fetch("contact")
    @page_title = @contact["title"]
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

  def missing_required_fields?
    @form_data.values_at("name", "email", "message").any?(&:blank?)
  end
end
