# == Schema Information
#
# Table name: order_items
#
#  id          :integer          not null, primary key
#  quantity    :integer
#  price       :decimal(, )
#  state       :string
#  order_id    :integer          not null
#  source_type :string
#  source_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class OrderItem < ApplicationRecord
  SOLD = "sold"
  RETURNED = "returned"
  STATES = [SOLD, RETURNED].freeze
  validates_presence_of :order_id, :source_id, :source_type, :price

  validates :state,
            absence: true,
            if: -> { source_type != Product.name }

  validates :state,
            allow_nil: false,
            inclusion: STATES,
            if: -> { source_type == Product.name && order.building_at.present? }

  validates :quantity,
            presence: true,
            numericality: {
              greater_than: 0
            }

  belongs_to :order
  belongs_to :source,
             polymorphic: true
end
