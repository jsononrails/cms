class AddShowInMenuToPages < ActiveRecord::Migration
  def change
    add_column :pages, :show_in_menu, :boolean
  end
end
