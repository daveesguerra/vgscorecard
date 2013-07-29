class CreateScores < ActiveRecord::Migration
  def up
    create_table :scores do |t|
      t.integer :hole_id
      t.integer :user_id
      t.integer :score
      t.date :played_on
      
      t.timestamps
    end
    add_index :scores, :hole_id
    add_index :scores, :user_id
  end

  def down
    drop_table :scores
  end
end
