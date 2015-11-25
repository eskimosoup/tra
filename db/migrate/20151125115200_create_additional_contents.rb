class CreateAdditionalContents < ActiveRecord::Migration
  def change
    create_table :additional_contents do |t|
      t.string :area, unique: true, null: false
      t.string :title
      t.text :content, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
