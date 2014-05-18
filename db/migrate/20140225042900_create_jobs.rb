class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.string :image_url
      t.references :category, index: true
      t.boolean :status
      t.datetime :from
      t.datetime :to

      t.timestamps
    end
  end
end
