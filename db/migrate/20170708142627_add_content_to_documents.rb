class AddContentToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :content, :text, null: false
  end
end
