class AddIndexOnTags < ActiveRecord::Migration[5.2]
  def change
    add_index(:tags, :name, unique: true)
  end
end
