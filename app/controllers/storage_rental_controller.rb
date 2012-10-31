class StorageRentalController < ApplicationController
  layout "storage_rental"

  def show
    render layout: "application"

  end

  def how_it_works
    @quote = Quote.new

  end

  def pricing
    @quote = Quote.new

  end

  def quote

  end

  def faq

  end


end
