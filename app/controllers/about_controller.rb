class AboutController < ApplicationController
  def show
    @about = site_content.fetch("about")
    @page_title = @about["title"]
  end
end
