class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :suite
      t.string :streetaddress
      t.string :city
      t.string :province
      t.string :postalcode
      t.string :phone
      t.string :fax
      t.string :email
      t.text :description
      t.text :notes

      t.timestamps
    end
  end
end
