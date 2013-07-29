class CreateHoles < ActiveRecord::Migration
  def up
    create_table :holes do |t|
      t.integer :course_id
      t.integer :hole_number
      t.integer :par
      t.integer :yards
      
      t.timestamps
    end
    add_index :holes, :course_id
  end

  def down
    drop_table :holes
  end
end
