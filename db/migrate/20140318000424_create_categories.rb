class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :title
      t.belongs_to :parent, index: true

      t.timestamps
    end
  end
end
