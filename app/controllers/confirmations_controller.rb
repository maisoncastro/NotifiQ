class ConfirmationsController < ApplicationController
  def new
    @confirmation = Confirmation.new
  end

  def create
    @confirmation = Confirmation.new(confirmation_params)
    @confirmation.customer = current_customer_user
    @store = Store.find(params[:store_id])
    @confirmation.store = @store
    if @confirmation.save
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
