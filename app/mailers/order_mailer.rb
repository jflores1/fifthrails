class OrderMailer < ActionMailer::Base
  default from: "service@fifthroomstorage.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  def new_order(order)
    @greeting = "Hi"
    @order = order

    mail to: "service@fifthroomstorage.com", subject: "You received a new order"
  end
end
