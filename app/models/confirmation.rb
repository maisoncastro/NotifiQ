class Confirmation < ApplicationRecord
  belongs_to :user
  belongs_to :store

  # validates :start_time, presence: true
  # validates :end_time, presence: true
  # validates :position, presence: true
  # validates :qrcode, presence: true
end
