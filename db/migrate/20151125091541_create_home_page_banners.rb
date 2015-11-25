class CreateHomePageBanners < ActiveRecord::Migration
  def change
    create_table :home_page_banners do |t|
      t.integer :position
      t.string :title
      t.string :image
      t.text :content, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
