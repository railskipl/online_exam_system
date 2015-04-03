class Answer < ActiveRecord::Base
	belongs_to :questions
	validates :content, :presence => true
end
