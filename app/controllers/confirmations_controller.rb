class ConfirmationsController < ApplicationController
  def index
    confirmations = Confirmation.all
    @stores = Store.all
    @user_confirmations = confirmations.select { |confirmation| confirmation.user_id == current_user.id }
  end

  def edit
    @confirmation = Confirmation.find(params[:id])
    @confirmation.completed = true
    @confirmation.save!
  end

  def show
    @confirmation = Confirmation.find(params[:id])
    @store = Store.find(params[:store_id])
    completed_confirmations = @store.confirmations.select(&:completed)
    @current_position = @confirmation.position - completed_confirmations.count
    # one_minute = 60
    # @time = (10 * one_minute * @current_position)
    # @time = 10

    @url = "stores/#{@store.id}/confirmations/#{@confirmation.id}/edit"
    @store_qrcode = RQRCode::QRCode.new("http://notifiq.herokuapp.com/#{@url}")

    @svg = @store_qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
    @markers = [{
      lat: @store.latitude,
      lng: @store.longitude
    }]
  end

  def new
    @confirmation = Confirmation.new
    @store = Store.find(params[:store_id])
    pending_confirmations = @store.confirmations.reject(&:completed)
    @current_position = pending_confirmations.count
    @average_wait_time = 10 * @current_position
    # @current_time = Time.now.to_i
    # raise
  end

  def create
    @confirmation = Confirmation.new
    @store = Store.find(params[:store_id])
    @confirmation.store = @store
    @confirmation.user = current_user
    @confirmation.position = @store.confirmations.count + 1

    pending_confirmations = @store.confirmations.reject(&:completed)
    current_position = pending_confirmations.count

    one_minute = 60 # seconds

    case @store.name
    when 'SAQ Express'
      wait_time = (3 * one_minute)
    when 'SQDC Berri'
      wait_time = (10 * one_minute)
    else
      wait_time = (10 * 60 * current_position)
    end

    now_utc = Time.now.to_i
    @confirmation.expected_visit_time = now_utc + wait_time

    if @confirmation.save!
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
