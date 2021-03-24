class Store < ApplicationRecord
  belongs_to :user
  has_many :confirmations
  validates :name, uniqueness: true

  # after_create :store_qrcode

  def store_qrcode
    self.code = SecureRandom.hex
    save
  end
end
