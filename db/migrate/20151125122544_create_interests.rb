class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.integer :position
      t.string :title, null: false
      t.string :link
      t.string :file
      t.string :image
      t.string :colour, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
