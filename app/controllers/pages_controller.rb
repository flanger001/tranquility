class PagesController < ApplicationController
  def newsletter_signup
    @form = MailchimpForm.new
  end
end
