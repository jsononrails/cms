class AddGooglCodeToSites < ActiveRecord::Migration
  def change
    add_column :sites, :ga_code, :string
  end
end
