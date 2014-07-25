class AddCustomFieldsToCkeditorAssets < ActiveRecord::Migration
  def change
    add_column :ckeditor_assets, :title, :string
    add_column :ckeditor_assets, :alttag, :string
    add_column :ckeditor_assets, :intro, :string
    add_column :ckeditor_assets, :description, :string
  end
end
