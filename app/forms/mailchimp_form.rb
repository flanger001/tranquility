class MailchimpForm
  include ActiveModel::Model

  BASE_URL = "https://atouchoftranquilityspa.us6.list-manage.com"
  PATH = "/subscribe/post"
  QUERY = {
    :u => "3191adc4218068680f566d8cd",
    :id => "597d51beae"
  }
  EMAIL_TYPES = [
    ["html", "HTML"],
    ["text", "Plain text"]
  ]

  attr_accessor :email, :fname, :lname, :emailtype

  def url
    uri = URI(BASE_URL)
    uri.path = PATH
    uri.query = QUERY.to_param
    uri.to_s
  end

  def token
    "b_#{QUERY[:u]}_#{QUERY[:id]}"
  end
end
