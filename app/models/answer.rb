class Answer < ActiveRecord::Base
	belongs_to :question
	belongs_to :result
 	validates :content, :presence => true
 	#validates :correct_answer, acceptance: true
end

