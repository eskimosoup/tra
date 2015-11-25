class AddSidebarToPages < ActiveRecord::Migration
  def change
    add_column :pages, :sidebar, :string
  end
end
