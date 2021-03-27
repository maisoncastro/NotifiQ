class Store < ApplicationRecord
  belongs_to :user
  has_many :confirmations
  validates :name, uniqueness: true

  after_create :store_qrcode1

  def store_qrcode1
    self.store_qrcode = SecureRandom.hex
    save
  end
  
end
