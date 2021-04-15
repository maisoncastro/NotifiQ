class DashboardController < ApplicationController
  def index
    @business_stores = Store.find_by(user_id: current_user)
    @store = Store.where(user_id: current_user)

    @markers = @store.geocoded.map do |s|
      {
        lat: s.latitude,
        lng: s.longitude
      }
    end
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
