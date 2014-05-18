class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.belongs_to :user, null: false, index: true
      t.string :direct_upload_url, null: false
      t.attachment :upload
      t.boolean :processed, default: false, null: false, index: true

      t.timestamps
    end
  end
end