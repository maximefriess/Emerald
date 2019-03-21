class PagesController < ApplicationController
  def faq
    @title = "FAQ"
    render template: "pages/faq"
  end

  def admin
    render template: "pages/admin"
  end
end
