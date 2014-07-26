class Pagebanner < ActiveRecord::Base
  belongs_to :page
  belongs_to :banner, foreign_key: "ckeditor_asset_id"
end
