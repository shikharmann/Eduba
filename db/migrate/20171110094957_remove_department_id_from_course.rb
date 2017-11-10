class RemoveDepartmentIdFromCourse < ActiveRecord::Migration[5.0]
  def change
    remove_column :courses, :department_id
  end
end
