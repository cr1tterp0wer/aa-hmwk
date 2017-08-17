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

class Bus < ApplicationRecord
  belongs_to :route,
    class_name: 'Route',
    foreign_key: :route_id,
    primary_key: :id

  has_many :drivers,
    class_name: 'Driver',
    foreign_key: :bus_id,
    primary_key: :id
end
