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
class Address < ApplicationRecord
  validates_presence_of   :address1, :city, :state, :user_id
  validates_uniqueness_of :user_id

  validates :zipcode,
            format: {
              with: /\A\d{5}\z/,
              message: "not valid. Please enter your 5 digit zipcode"
            }, presence: true

  belongs_to :user

  has_many   :orders
end
