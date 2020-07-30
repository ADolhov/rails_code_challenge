# == Schema Information
#
# Table name: orders
#
#  id          :integer          not null, primary key
#  number      :string           not null
#  state       :string
#  total       :decimal(, )
#  building_at :datetime
#  canceled_at :datetime
#  arrived_at  :datetime
#  user_id     :integer          not null
#  address_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Order < ApplicationRecord
  BUILDING = "building"
  ARRIVED = "arrived"
  CANCELED = "canceled"
  STATES = [BUILDING, ARRIVED, CANCELED].freeze

  validates_presence_of :user_id, :state

  validates   :total,
              presence: true,
              format: {
                with: /\A-?\d+\.?\d{0,2}\z/,
                message: 'only accepts 2 decimal places.'
              }


  scope :arrived, -> { where.not(arrived_at: nil) }
  scope :by_coupon, ->(coupon_id) do
    joins(:order_items)
      .where(order_items: {source_type: "Coupon", source_id: coupon_id })
      .group(:id)
  end

  belongs_to :user
  belongs_to :address

  has_many :order_items
  has_many :payments

  def to_param
    number
  end
end
