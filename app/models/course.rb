class Course < ApplicationRecord
  belongs_to :institution
  has_many :lessons
  validates_presence_of :title, :number, :description, :day_of_the_week, :time_of_day

  def title_day
		"#{title} is held on #{day_of_the_week}"  	
  end

  def self.by_title
		order('LOWER(title)')  	
  end

  def self.by_number
  	order('LOWER(number)')
  end
end
