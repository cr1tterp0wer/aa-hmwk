# == Schema Information
#
# Table name: toys
#
#  id           :integer          not null, primary key
#  name         :string
#  toyable_id   :integer
#  toyable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Toy < ApplicationRecord
 
  validates :name, :toyable_type,:toyable_id, uniqueness:true
  belongs_to :toyable, polymorphic: true
  has_many :corgis, as: :toyable
  has_many :cats,   as: :toyable



end
