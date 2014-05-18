class AddJobToDocuments < ActiveRecord::Migration
  def change
    add_reference :documents, :job, index: true
  end
end
