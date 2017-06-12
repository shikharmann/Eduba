class CreateTopics < ActiveRecord::Migration[5.0]
  def change
    create_table :topics do |t|
      t.string :name, null: false
      t.belongs_to :course, null: false, index: true
      t.timestamps
    end
  end
end
