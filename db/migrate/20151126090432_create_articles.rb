class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title, null: false
      t.text :summary
      t.text :content, null: false
      t.string :image
      t.date :date, null: false
      t.boolean :display, default: true
      t.string :slug, unique: true
      t.string :suggested_url, unique: true

      t.timestamps null: false
    end
  end
end
