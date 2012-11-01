class QuoteMailer < ActionMailer::Base
  default from: "service@fifthroomstorage.com"

  def new_quote(quote)
    @greeting = "Hi"
    @quote = quote

    mail to: "service@fifthroomstorage.com", subject: "New Quote request"
  end
end
