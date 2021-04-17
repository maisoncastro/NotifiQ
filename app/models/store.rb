class Store < ApplicationRecord
  belongs_to :user
  has_many :confirmations, dependent: :destroy
  validates :name, uniqueness: true

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  after_create :store_qrcode1

  def store_qrcode1
    self.store_qrcode = SecureRandom.hex
    save
  end
end
