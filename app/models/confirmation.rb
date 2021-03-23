class Confirmation < ApplicationRecord
  belongs_to :customer, optional: true
  belongs_to :store, optional: true

  # validates :start_time, presence: true
  # validates :end_time, presence: true
  # validates :position, presence: true
  # validates :qrcode, presence: true
end
