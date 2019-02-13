class AddSlugToTag < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :slug, :string
  end
end
