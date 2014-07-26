class CreatePageBanners < ActiveRecord::Migration
  def change
    create_table :pagebanners do |t|
      t.integer :page_id
      t.integer :banner_id
    end
  end
end
