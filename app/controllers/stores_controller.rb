class StoresController < ApplicationController
  require 'rqrcode'

  # This is still in progress
  # def storeqrcode
  #   @store = Store.last
  #   @code = @store.code

  #   @storeqr = RQRCode::QRCode.new(@code)

  #   @svg = storeqr.as_svg(
  #     offset: 0,
  #     color: '000',
  #     shape_rendering: 'crispEdges',
  #     module_size: 11
  #   )
  # end

  before_action :set_store, only: %i[show edit update]

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.user = current_business_user
    if @store.save
      redirect_to dashboard_index_path
    else
      render :new
    end
  end

  def update
    @store.update(store_params)
    if @store.save!
      redirect_to stores_show_path(@store)
    else
      render :new
    end
  end

  def edit
  end

  def show
    @store_qrcode = RQRCode::QRCode.new("https://notifiq.herokuapp.com/confirmations/new")
    @svg = @store_qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 11
    )
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address, :capacity, :store_qrcode, :longitude, :latitude, :message)
  end
end
