class CreateCourses < ActiveRecord::Migration
  def up
    create_table :courses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :province
      t.string :country
      t.string :postal
      t.integer :course_type_id
      t.float :latitude
      t.float :longitude
      
      t.timestamps
    end
    add_index :courses, :course_type_id
  end

  def down
    drop_table :courses
  end
end
