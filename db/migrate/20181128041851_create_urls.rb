class CreateUrls < ActiveRecord::Migration[5.2]
  def change
  	create_table :urls do |t|
  		t.string :url
  		t.integer :user_id
  		t.string :id_base32
  	end
  end
end
