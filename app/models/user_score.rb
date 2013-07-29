class UserScore < ActiveRecord::Base
  attr_accessible :user_id, :scorecard_id
  
  has_many :scores
  belongs_to :scorecard
  belongs_to :user
  
  accepts_nested_attributes_for :scores, reject_if: lambda { |a| a[:score].blank? }
  attr_accessible :scores_attributes
  
  def total
    self.scores.sum("score")
  end
  
  def hole_in_ones
    self.scores.where("score = ?", 1).count
  end
  
  def albatrosses
    i = 0
    self.scores.each do |s|
      if s.score == s.hole.par-3
        i = i + 1
      end
    end
    i
  end
  
  def eagles
    i = 0
    self.scores.each do |s|
      if s.score == s.hole.par-2
        i = i + 1
      end
    end
    i
  end
  
  def birdies
    i = 0
    self.scores.each do |s|
      if s.score == s.hole.par-1
        i = i + 1
      end
    end
    i
  end
  
  def evens
    i = 0
    self.scores.each do |s|
      if s.score == s.hole.par
        i = i + 1
      end
    end
    i
  end
  
  def bogeys
    i = 0
    self.scores.each do |s|
      if s.score == s.hole.par+1
        i = i + 1
      end
    end
    i
  end
  
  def double_bogeys
    i = 0
    self.scores.each do |s|
      if s.score == s.hole.par+2
        i = i + 1
      end
    end
    i
  end
  
  def more_bogeys
    i = 0
    self.scores.each do |s|
      if s.score > s.hole.par+2
        i = i + 1
      end
    end
    i
  end

end