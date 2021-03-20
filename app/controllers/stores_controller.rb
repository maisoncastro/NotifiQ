class StoresController < ApplicationController
  require 'rqrcode'

  def storeqrcode
    @store = Store.last
    @code = @store.code

    @storeqr = RQRCode::QRCode.new(qr_params)
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
