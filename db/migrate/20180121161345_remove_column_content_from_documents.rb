class RemoveColumnContentFromDocuments < ActiveRecord::Migration[5.0]
  def change
    remove_column :documents, :content
    remove_column :documents, :content_path
  end
end
