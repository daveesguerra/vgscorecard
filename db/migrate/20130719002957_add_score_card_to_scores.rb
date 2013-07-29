class AddScoreCardToScores < ActiveRecord::Migration
  def change
    add_column :scores, :scorecard_id, :integer
    add_index :scores, :scorecard_id
  end
end
