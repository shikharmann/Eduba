class AddContentPathToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :content_path, :string
  end
end
