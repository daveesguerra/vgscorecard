class AddUserScoresToScore < ActiveRecord::Migration
  def change
    add_column :scores, :user_score_id, :integer
    add_index :scores, :user_score_id
  end
end
