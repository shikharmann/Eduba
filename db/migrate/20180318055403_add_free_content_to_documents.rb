class AddFreeContentToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :free_content, :boolean, null: false, default: false
  end
end
