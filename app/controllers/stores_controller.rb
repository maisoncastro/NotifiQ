class StoresController < ApplicationController
  require 'rqrcode'
 #This is still in progress
  def storeqrcode
    @store = Store.last
    @code = @store.code

    @storeqr = RQRCode::QRCode.new(@code)

    @svg = qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6,
      standalone: true
    )
  end

  def update
    @store.update(store_params)
      if @store.save!
      redirect_to stores_path(@stores)
    else
      render :edit
    end
  end

  def edit

  end

  def show
    @store = Store.new
  end

  private

  def qr_params
    
  end

end
