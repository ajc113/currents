class InvoicesController < ApplicationController
  def index
    @invoices = Invoice.find_all_by_user(current_user)
  end

  def show
    @invoice = Invoice.new(params[:id])
    if @invoice.user == current_user
      render
    end
  end
end
