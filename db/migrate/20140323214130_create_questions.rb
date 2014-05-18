class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :inquiry
      t.text :answer
      t.string :image_url
      t.references :user, index: true
      t.belongs_to :job, index: true

      t.timestamps
    end
  end
end
