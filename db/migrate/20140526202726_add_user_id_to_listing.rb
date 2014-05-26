class AddUserIdToListing < ActiveRecord::Migration
  def up
    add_column :listings, :user_id, :integer
    add_column :listings, :name, :string
  end

  def down
    remove_column :listings, :user_id
    remove_column :listings, :name
  end
end
