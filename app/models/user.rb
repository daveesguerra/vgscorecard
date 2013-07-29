class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :first_name, :last_name, :role, :password, :email, :confirmed_at, :name, :password_confirmation
  
  has_many :scores, through: :user_scores
  has_many :user_scores, dependent: :destroy
  has_many :scorecards, through: :user_scores
  
  validates :name, :email, :password, presence: true
  
  def to_param
    "#{name}".parameterize
  end
  
  def favorite_course
    
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