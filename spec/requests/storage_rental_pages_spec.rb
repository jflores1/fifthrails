require 'spec_helper'

describe "StorageRentalPages" do

  subject {page}

  context "Working routes" do
    describe "Root Path" do
      it "gets the root path" do
        get root_path
        response.status.should be(200)
      end
    end

    describe "How it Works Path"
    it "gets how_it_works" do
      get how_it_works_path
      response.status.should be(200)
    end

    describe "Pricing Path" do
      it "gets pricing_path" do
        get pricing_path
        response.status.should be(200)
      end
    end

    describe "FAQ Path" do
      it "gets faq_path" do
        get frequently_asked_questions_path
        response.status.should be(200)
      end
    end

    describe "Quote path" do
      it "gets quote_path" do
        get storage_quote_path
        response.status.should be(200)
      end
    end

  end

  context "How it Works Path" do
    before {visit how_it_works_path}

    describe "It should have how it works in the title" do
      it {should have_selector('title', text: "How storage rental works")}
    end

    describe "Request a quote" do
      before {visit how_it_works_path}
      let(:submit){ "Get Quote"}

      describe "with valid information" do
        before do
          choose  "Residential"
          choose  "Storage"
          fill_in "Customer Location",  with: 30082
          fill_in "datepicker",         with: "2012-11-01"
          fill_in "Email",              with: "jesse@test.com"
          fill_in "Phone",              with: "555-555-5555"
        end

        it "should create a quote" do
          expect {click_button submit}.to change{Quote.count}.by(1)
        end
        it {should have_selector('div', id:"#new_quote_modal")}
      end

    end
  end

  context "Pricing Page has Quote Form" do
    before {visit pricing_path}

    describe "It should have quote form" do
      it {should have_selector("div", id:"sidebar-quote-form")}
    end
  end

end
