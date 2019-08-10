class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.date :date
      t.string :where
      t.string :img_url
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
