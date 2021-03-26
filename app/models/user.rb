class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :confirmations
  has_many :stores

  scope :business_users, -> { where(type: 'BusinessUser') }
  scope :customers, -> { where(type: 'Customer') }

  # def customer?
  #   type == 'Customer'
  # end

  # def business?
  #   type == 'Business'
  # end
end
