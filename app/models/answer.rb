class Answer < ActiveRecord::Base
	
	belongs_to :questions
	validates :content, :presence => true
	belongs_to :result

end
