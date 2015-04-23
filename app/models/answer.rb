class Answer < ActiveRecord::Base

	

	belongs_to :questions


	belongs_to :question

	validates :content, :presence => true
	belongs_to :result


validate :answer_count

def answer_count
  self.errors[:base] << "Can have answers only between 2 and 5" if answers.length<1 || answers.length>5
end
	
end
