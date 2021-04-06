class ConfirmationsController < ApplicationController
  def index
    @confirmations = Confirmation.all

<<<<<<< HEAD
  def create
    @confirmation = Confirmation.new(confirmation_params)
    @confirmation.user = current_user
    @store = Store.find(params[:store_id])
    @confirmation.store = @store
    if @confirmation.save
      ConfirmationMailer.confirmation_email(current_user).deliver
      redirect_to confirmations_path, notice: 'Confirmation was successfully created.'
    else
      render :new
    end
=======
    @store_qrcode = RQRCode::QRCode.new("http://localhost:3030/confirmations/")

    @svg = @store_qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
>>>>>>> master
  end

  def show
    @confirmation = Confirmation.find(params[:id])
    @store = Store.find(params[:store_id])

    @store_qrcode = RQRCode::QRCode.new(destroy_customer_session_path)


    @svg = @store_qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
  end

  def new
    @confirmation = Confirmation.new
  end

  def create
    @confirmation = Confirmation.new(confirmation_params)
    @store = Store.find(params[:store_id])
    @confirmation.store = @store
    @confirmation.user = current_user
    if @confirmation.save
      redirect_to confirmations_index_path
    else
      render :new
    end
  end

  private

  def confirmation_params
    params.require(:confirmation).permit(:start_time, :end_time, :position, :qrcode)
  end
end
