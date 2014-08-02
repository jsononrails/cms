class AddIntroToPages < ActiveRecord::Migration
  def change
    add_column :pages, :intro, :string
  end
end
