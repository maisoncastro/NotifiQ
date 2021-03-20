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

  end

  def edit

  end

  def show

  end

  private

  def qr_params
    
  end

end
