# == Schema Information
#
# Table name: payments
#
#  id           :integer          not null, primary key
#  order_id     :integer          not null
#  amount       :decimal(, )
#  state        :string
#  completed_at :datetime
#  refunded_at  :datetime
#  payment_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
