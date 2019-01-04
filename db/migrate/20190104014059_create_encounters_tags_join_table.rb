class CreateEncountersTagsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :encounters, :tags do |t|
      t.timestamps
    end
  end
end
