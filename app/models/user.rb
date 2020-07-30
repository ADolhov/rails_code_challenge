# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord

  validates :name,
            presence: true

  validates :email,
            presence: true,
            uniqueness: true

  has_many :orders
  has_many :addresses

  def arrived_orders_by_coupon(coupon_id)
    orders.arrived.by_coupon(coupon_id)
  end

  def arrived_orders_revenue(coupon_id)
    arrived_orders_by_coupon(coupon_id).pluck(:total).sum
  end
end
