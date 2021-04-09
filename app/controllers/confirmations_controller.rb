class ConfirmationsController < ApplicationController
  def index
    @confirmations = Confirmation.all

    @store_qrcode = RQRCode::QRCode.new("http://localhost:3030/confirmations/")

    @svg = @store_qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
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
    @markers = [{
      lat: @store.latitude,
      lng: @store.longitude
      # infoWindow: render_to_string(partial: "info_window", locals: { store: @store })
    }]
  end

  def new
    @confirmation = Confirmation.new
    @store = Store.find(params[:store_id])
  end

  def create
    @confirmation = Confirmation.new
    @store = Store.find(params[:store_id])
    @confirmation.store = @store
    @confirmation.user = current_user
    if @confirmation.save
      ConfirmationMailer.confirmation_email(current_user).deliver_now

      redirect_to confirmations_path
    else

      render :new
    end
  end

  # def confirmation_params
  #   params.require(:confirmation).permit(:start_time, :end_time, :position, :qrcode)
  # end
end
