class Score < ActiveRecord::Base
  attr_accessible :hole_id, :user_id, :score, :played_on, :user_score_id, :scorecard_id
  
  belongs_to :user
  belongs_to :hole
  belongs_to :user_score

  validates :score, numericality: true
  
  def rank
    if score <= hole.par-2
      return "under eagle"
    elsif score == hole.par-1
      return "under birdie"
    elsif score == hole.par
      return "even"
    elsif score == hole.par+1
      return "over bogey"
    else
      return "over doublebogey"
    end
  end
end