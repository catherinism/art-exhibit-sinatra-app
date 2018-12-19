class CreateExhibits < ActiveRecord::Migration
  def change
    create_table :exhibits do |t|
      t.string :theme
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
