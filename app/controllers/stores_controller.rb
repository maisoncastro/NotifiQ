class StoresController < ApplicationController
  require 'rqrcode'
  # This is still in progress
  # def storeqrcode
  #   @store = Store.last
  #   @code = @store.code

  #   @storeqr = RQRCode::QRCode.new(@store.code)
  # end

  before_action :set_store, only: %i[show edit update]

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.business_user_id = current_user.id
    # raise
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
    @store = Store.new
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address, :capacity, :store_qrcode, :longitude, :latitude, :message)
  end
end
