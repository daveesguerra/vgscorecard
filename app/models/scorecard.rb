class Scorecard < ActiveRecord::Base
  attr_accessible :course_id, :played_on
  
  has_many :user_scores, dependent: :destroy
  has_many :users, through: :user_scores
  belongs_to :course
  accepts_nested_attributes_for :user_scores, reject_if: lambda { |a| a[:user_id].blank? }
  attr_accessible :user_scores_attributes
  
  validates :played_on, :course_id, presence: true
  
  def top_score
    top = self.user_scores.first
    self.user_scores.each do |u|
      if u.total > top.total
        top = u
      end
    end
    top.total
  end
  
  def top_player
    top = self.user_scores.first
    self.user_scores.each do |u|
      if u.total < top.total
        top = u
      end
    end
    top.user    
  end

end