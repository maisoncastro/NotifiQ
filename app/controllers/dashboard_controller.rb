class DashboardController < ApplicationController
  def index
    @stores = Store.all
    raise
    @markers = [{
      lat: @store.latitude,
      lng: @store.longitude
    }]
  end

  def settings
    @store_qrcode = RQRCode::QRCode.new("notifiq.herokuapp.com/stores/1/confirmations/new")

    @svg = @store_qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 4
    )
  end
end
