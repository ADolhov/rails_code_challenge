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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
