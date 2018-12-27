class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :title
      t.string :deadline
      t.string :medium
      t.string :exhibit_date
      t.string :location
      t.string :entry_fee
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
