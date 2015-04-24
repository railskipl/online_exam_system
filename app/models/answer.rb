class Answer < ActiveRecord::Base

	

	belongs_to :questions


	belongs_to :question

	validates :content, :presence => true
	belongs_to :result


		
	
end
