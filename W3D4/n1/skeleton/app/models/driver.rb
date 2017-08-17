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

class Driver < ApplicationRecord
  belongs_to :bus,
    class_name: 'Bus',
    foreign_key: :bus_id,
    primary_key: :id
end
