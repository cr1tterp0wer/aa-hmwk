class CreatesHousesTable < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |h|
      h.string :address,null: false
      h.timestamp "created_at"
    end
  end
end
