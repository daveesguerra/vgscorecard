class CreateUserScores < ActiveRecord::Migration
  def up
    create_table :user_scores do |t|
      t.integer :user_id
      t.integer :scorecard_id
      
      t.timestamps    
    end
    add_index :user_scores, :user_id
    add_index :user_scores, :scorecard_id
  end

  def down
  end
end
