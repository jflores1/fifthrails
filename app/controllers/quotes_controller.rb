class QuotesController < ApplicationController

  def show
    @quote = Quote.find(params[:id])

  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(params[:quote])
    if @quote.save!
      respond_to do |format|
        format.js
      end
    else
      flash[:error] = "Sorry, you didn't fill out the form properly."
      render 'forms/form_quote'
    end
  end
end
