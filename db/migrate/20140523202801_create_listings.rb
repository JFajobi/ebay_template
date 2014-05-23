class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|
      t.text :html
      t.text :image

      t.timestamps
    end
  end
end
