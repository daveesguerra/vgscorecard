class Course < ActiveRecord::Base
  attr_accessible :name, :address, :city, :province, :country, :postal, :course_type_id, :latitude, :longitude
  attr_accessible :gmaps, :phone
  
  attr_accessor :saddr
  attr_accessible :saddr
  
  belongs_to :course_type
  has_many :holes, dependent: :destroy
  has_many :scorecards, dependent: :destroy
  
  accepts_nested_attributes_for :holes, reject_if: lambda { |a| a[:yards].blank? }
  attr_accessible :holes_attributes
  
  validates :name, :address, :city, :province, :country, :postal, :course_type_id, presence: true
  
  acts_as_gmappable

  def gmaps4rails_address
  #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    "#{self.address}, #{self.city}, #{self.country}, #{self.postal}" 
  end
  
  def par
    p = 0
    self.holes.each do |h|
      p = p + h.par
    end
    return p
  end
  
  def total_yards
    y = 0
    self.holes.each do |h|
      y = y + h.yards
    end
    return y
  end
  
  def total_red
    y = 0
    self.holes.each do |h|
      y = y + h.red
    end
    return y
  end  

  def total_blue
    y = 0
    self.holes.each do |h|
      y = y + h.blue
    end
    return y
  end
  
  def course_average
    total_plays = 0
    total_score = 0
    
    self.scorecards.each do |sc|
      sc.user_scores.each do |u|
        total_plays = total_plays + 1
        u.scores.each do |s|
          total_score = total_score + s.score
        end
      end
    end
    
    return total_score/total_plays
  end
  
  def top_player
    top = self.scorecards.first.user_scores.first
    self.scorecards.each do |sc|
      sc.user_scores.each do |u|
        if u.total < top.total
          top = u
        end
      end
    end
    top.user
  end
  
  def top_score
    top = self.scorecards.first.user_scores.first
    self.scorecards.each do |sc|
      sc.user_scores.each do |u|
        if u.total < top.total
          top = u
        end
      end
    end
    top.total
  end
  
  def last_played
    sc = self.scorecards.order("played_on DESC").first
    sc.played_on
  end
  
  def front_9_par
    par = 0
    self.holes.where('hole_number < 10').each do |h|
      par = par + h.par
    end
    return par
  end
  
  def front_9_yards
    yards = 0
    self.holes.where('hole_number < 10').each do |h|
      yards = yards + h.yards
    end
    return yards    
  end
  
  def back_9_par
    par = 0
    self.holes.where('hole_number >= 10').each do |h|
      par = par + h.par
    end
    return par    
  end
  
  def back_9_yards
    yards = 0
    self.holes.where('hole_number >= 10').each do |h|
      yards = yards + h.yards
    end
    return yards    
  end
  
  def hole_in_ones
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.hole_in_ones
      end
    end
    total
  end

  def albatrosses
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.albatrosses
      end
    end
    total
  end

  def eagles
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.eagles
      end
    end
    total
  end  
  
  def birdies
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.birdies
      end
    end
    total
  end 
  
  def evens
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.evens
      end
    end
    total
  end  
  
  def bogeys
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.bogeys
      end
    end
    total
  end   
  
  def double_bogeys
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.double_bogeys
      end
    end
    total
  end
  
  def more_bogeys
    total = 0
    self.scorecards.each do |s|
      s.user_scores.each do |u|
        total = total+u.more_bogeys
      end
    end
    total
  end    
end