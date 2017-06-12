class CreateSubtopics < ActiveRecord::Migration[5.0]
  def change
    create_table :subtopics do |t|
      t.string :name, null: false
      t.belongs_to :topic, null: false, index: true
      t.timestamps
    end
  end
end
