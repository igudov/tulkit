class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :email
      t.string :avatar_url
      t.string :phone
      t.boolean :bidder
      t.text :info

      t.timestamps
    end
  end
end
