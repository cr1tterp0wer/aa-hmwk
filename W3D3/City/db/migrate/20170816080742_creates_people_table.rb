class CreatesPeopleTable < ActiveRecord::Migration[5.1]
  def change
    create_table :people do |person|
      person.string :name, null: false
      person.timestamp "created_at"
      person.integer :house_id

    end
  end
end
