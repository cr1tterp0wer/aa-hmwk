# == Schema Information
#
# Table name: drivers
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  bus_id     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_drivers_on_bus_id  (bus_id)
#

require 'test_helper'

class DriverTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
