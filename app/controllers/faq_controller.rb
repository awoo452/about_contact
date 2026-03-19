class FaqController < ApplicationController
  def show
    @faq = site_content.fetch("faq")
    @page_title = @faq["title"]
  end
end
