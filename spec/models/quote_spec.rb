# == Schema Information
#
# Table name: quotes
#
#  id                 :integer          not null, primary key
#  customer_type      :string(255)
#  customer_need      :string(255)
#  customer_location  :integer
#  customer_need_date :date
#  quote_email        :string(255)
#  quote_phone_number :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'spec_helper'

describe Quote do
  let(:quote){Quote.new(customer_type:"Residential", customer_need:"Storage", customer_location:30082, customer_need_date:12/12/2012, quote_email:"email@email.com", quote_phone_number:"555-555-5555")}
  subject { quote }

  context "Can create a new instance of the quote object" do
    describe "it responds to accessible attributes" do
      it {should respond_to(:customer_need)}
      it {should respond_to(:customer_type)}
      it {should respond_to(:customer_location)}
      it {should respond_to(:customer_need_date)}
      it {should respond_to(:quote_email)}
      it {should respond_to(:quote_phone_number)}
    end
  end

  context "Invalid information" do
    describe "Customer type is blank" do
      before {quote.customer_type = ""}
      it {should_not be_valid}
    end

    describe "- customer type is not business or residential" do
      before {quote.customer_type = "Customer"}
      it {should_not be_valid}
    end

    describe "- customer need is empty" do
      before {quote.customer_need = " "}
      it {should_not be_valid}
    end

    describe " - the customer need is not storage or moving or both" do
      before {quote.customer_need = "Something Else"}
      it {should_not be_valid}
    end

    describe "- a quote without a location" do
      before {quote.customer_location = " "}
      it {should_not be_valid}
    end

    describe " - a non-numerical zip code" do
      before {quote.customer_location = "a"*5}
      it {should_not be_valid}
    end

    describe " - a zip code with too many digits" do
      before {quote.customer_location = 123456}
      it {should_not be_valid}
    end

    describe " - a zip code with too few digits" do
      before {quote.customer_location = 123}
      it {should_not be_valid}
    end

    describe " - without a customer email address" do
      before {quote.quote_email = " "}
      it {should_not be_valid}
    end

    describe "- with invalid syntax" do
      before {quote.quote_email = "jesse@test"}
      it {should_not be_valid}
    end

    describe "- without a need date" do
      before {quote.customer_need_date = " "}
      it {should_not be_valid}
    end

    describe "- without a phone number" do
      before {quote.quote_phone_number = " "}
      it {should_not be_valid}
    end

    describe "- with a phone number that's too long" do
      before {quote.quote_phone_number = "a"*14}
      it {should_not be_valid}
    end

    describe "- with a phone number that's too short" do
      before {quote.quote_phone_number = "a"*6}
      it {should_not be_valid}
    end

  end

  context "With valid information" do
    describe "- with valid customer type" do
      before {quote.customer_type = "Residential"}
      it {should be_valid}
      it {expect{quote.save!}.to change{Quote.count}.by(1)}
    end

    describe "- with valid customer need" do
      before {quote.customer_need = "Storage"}
      it {should be_valid}
      it {expect{quote.save!}.to change{Quote.count}.by(1)}
    end

    describe "- a zip code with 5 digits" do
      before {quote.customer_location = 30309}
      it {should be_valid}
    end

    describe "- a valid 10 digit phone number" do
      before {quote.quote_phone_number = "5555555555"}
      it {should be_valid}
    end

    describe "- a valid 7 digit phone number" do
      before {quote.quote_phone_number = "5555555"}
      it {should be_valid}
    end

    describe "- a 7 digit phone number with dashes" do
      before {quote.quote_phone_number = "555-5555"}
      it {should be_valid}
    end

    describe "- a 10 digit phone number with dashes" do
      before {quote.quote_phone_number = "(555)555-5555"}
      it {should be_valid}
    end


  end

end
