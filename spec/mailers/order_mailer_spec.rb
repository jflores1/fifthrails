require "spec_helper"

describe OrderMailer do
  describe "new_order" do
    let(:mail) { OrderMailer.new_order }

    it "renders the headers" do
      mail.subject.should eq("New order")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
