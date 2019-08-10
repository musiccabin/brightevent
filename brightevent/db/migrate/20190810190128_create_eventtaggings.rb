class CreateEventtaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :eventtaggings do |t|
      t.references :event, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
