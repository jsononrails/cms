class CreateLayouts < ActiveRecord::Migration
  def change
    create_table :layouts do |t|
      t.string :layout
    end
  end
end
