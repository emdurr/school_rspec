class Institution < ApplicationRecord
	validates_presence_of :name, :discipline, :founded
	has_many :courses
	def name_founded
		"#{name} was founded #{founded}"
	end

	def founded_date
		formatted_found = founded.to_i
		if formatted_found < 1500
			"Ancient"
		elsif formatted_found < 1900
			"Old"
		else
			"New"
		end	
	end

	def check_downcase
		
	end

	def self.by_name
		order('LOWER(name)')
	end

	def self.by_founded
		order(:founded)
	end
end
