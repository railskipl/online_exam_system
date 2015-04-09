class Exam < ActiveRecord::Base
	
	has_many :questions, dependent: :destroy
	has_many :users
	has_many :userchoices
	#belongs_to :results
	accepts_nested_attributes_for :questions, :allow_destroy => true
	validates :name, :presence => true
    accepts_nested_attributes_for :userchoices
	#accepts_nested_attributes_for :results

end
