require 'spec_helper'

describe "StorageRentalPages" do

  subject {page}

  before {visit '/storage_rental/show'}
  it {should have_selector('title', text: "Default Page")}

end
