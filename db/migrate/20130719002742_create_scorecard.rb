class CreateScorecard < ActiveRecord::Migration
  def up
    create_table :scorecards do |t|
      t.integer :course_id
      t.date :played_on
      
      t.timestamps
    end
    add_index :scorecards, :course_id
  end

  def down
    drop_table :scorecards
  end
end
