class AddShowIdToEncounter < ActiveRecord::Migration[5.2]
  def change
    add_column :encounters, :user_index, :integer
  end
end
