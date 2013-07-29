class Hole < ActiveRecord::Base
  attr_accessible :course_id, :hole_number, :par, :yards, :red, :blue
  
  belongs_to :course
  has_many :scores, dependent: :destroy
  
  validates :hole_number, :par, :yards, numericality: true

  def average_score
    self.scores.average("score")
  end
  
  def max_score
    self.scores.maximum("score")
  end
  
  def min_score
    self.scores.minimum("score")
  end
  
  def hole_in_ones
    self.scores.where("score = ?", 1).count
  end
  
  def albatrosses
    self.scores.where("score = ?", self.par-3).count
  end
  
  def eagles
    self.scores.where("score = ?", self.par-2).count
  end
  
  def birdies
    self.scores.where("score = ?", self.par-1).count
  end
  
  def evens
    self.scores.where("score = ?", self.par).count
  end
  
  def bogeys
    self.scores.where("score = ?", self.par+1).count
  end
  
  def double_bogeys
    self.scores.where("score = ?", self.par+2).count
  end
  
  def more_bogeys
    self.scores.where("score > ?", self.par+2).count
  end
end