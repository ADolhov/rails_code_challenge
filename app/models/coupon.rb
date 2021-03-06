# == Schema Information
#
# Table name: coupons
#
#  id         :integer          not null, primary key
#  name       :string
#  amount     :decimal(, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Coupon < ApplicationRecord
  validates_presence_of :name

  validates   :amount,
              presence: true,
              numericality: {
                greater_than_or_equal_to: 0
              },
              format: {
                with: /\A-?\d+\.?\d{0,2}\z/,
                message: 'only accepts 2 decimal places.'
              }

  has_many :order_items,
           as: :source

  has_many :orders, through: :order_items
  has_many :users, through: :orders
end
