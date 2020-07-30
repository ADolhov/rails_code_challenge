# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  address1   :string
#  address2   :string
#  city       :string
#  zipcode    :string
#  state      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
