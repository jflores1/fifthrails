class StorageRentalController < ApplicationController
  layout "storage_rental"
  before_filter :new_quote_instance

  def show
    render layout: "application"

  end

  def how_it_works

  end

  def pricing

  end

  def quote

  end

  def faq

  end

  def new_quote_instance
    @quote = Quote.new
  end


end
