class CreateEncounters < ActiveRecord::Migration[5.2]
  def change
    create_table :encounters do |t|
      t.date :date
      t.time :time
      t.string :state
      t.string :county
      t.string :nearest_town
      t.text :conditions
      t.text :environment
      t.text :description
      t.boolean :witnesses
      t.integer :user_id
      t.integer :category_id

      t.timestamps
    end
  end
end
