class Store < ApplicationRecord
  belongs_to :business_user

  validates :name, uniqueness: true
end
