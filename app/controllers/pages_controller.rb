class PagesController < ApplicationController
  def faq
    @title = "FAQ"
    render template: "pages/faq"

  end
end
