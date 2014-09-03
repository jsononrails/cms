class AddSeoToPages < ActiveRecord::Migration
  def change
    add_column :pages, :meta_keywords, :string
    add_column :pages, :meta_description, :text
  end
end
