class AddFontToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :font, :string
  end
end
