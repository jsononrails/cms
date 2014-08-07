class AddPictureIdToPages < ActiveRecord::Migration
  def change
    add_column :pages, :picture_id, :integer
  end
end
