class Store < ApplicationRecord
  belongs_to :business_user
  validates :name, uniqueness: true

  after_create :store_qrcode

  def store_qrcode
    self.code = SecureRandom.hex
    save
  end

end
