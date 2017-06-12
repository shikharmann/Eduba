class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name, null: false
      t.belongs_to :department, null: false, index: true
      t.timestamps
    end
  end
end
