class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.text :description
      t.decimal :price, precision: 8, scale: 0
      t.string :image_url
      t.references :user, index: true
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
