# == Schema Information
#
# Table name: buses
#
#  id         :integer          not null, primary key
#  model      :string           not null
#  route_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_buses_on_route_id  (route_id)
#

require 'test_helper'

class BusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
