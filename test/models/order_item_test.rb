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
require 'test_helper'

class OrderItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
