class DropTemplateHtmlColumn < ActiveRecord::Migration
  def up
    remove_column :templates, :html 
    add_column :templates, :name, :string
  end

  def down
    add_column :templates, :html, :text
    remove_column :templates, :name
  end
end
