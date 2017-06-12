class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :name, null: false
      t.belongs_to :subtopic, null: false, index: true
      t.timestamps
    end
  end
end
