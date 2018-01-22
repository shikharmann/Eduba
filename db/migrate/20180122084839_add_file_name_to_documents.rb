class AddFileNameToDocuments < ActiveRecord::Migration[5.0]
  def change
    add_column :documents, :file_name, :string
  end
end
