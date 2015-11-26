class CreateContactQueryTypes < ActiveRecord::Migration
  def change
    create_table :contact_query_types do |t|
      t.integer :position
      t.string :query_type, null: false
      t.boolean :display, default: true

      t.timestamps null: false
    end
  end
end
