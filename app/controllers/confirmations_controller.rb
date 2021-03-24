class ConfirmationsController < ApplicationController
  def new
    @conifrmation = Confirmation.new
  end

  def create
    @conifrmation = Confirmation.new(confirmation_params)
    @conifrmation.customer = current_customer
    @store = Store.find(params[:store_id])
    @conifrmation.store = @store
    if @conifrmation.save
      redirect_to confirmations_index_path
    else
      render :new
    end
  end

  def show
    @confirmation = Confirmation.find(params[:id])
    @confirmation = Confirmation.new
  end

  def index
    @confirmations = Confirmation.all
  end

  private

  def confirmation_params
    params.require(:confirmation).permit(:start_time, :end_time, :position, :qrcode)
  end
end
