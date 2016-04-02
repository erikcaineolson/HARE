class AddImgLinkColumnToListings < ActiveRecord::Migration
  def change
   change_table :listings do |t|
      t.string :image_url, default: "http://placehold.it/100x100&text=[img]"
    end
  end
end
