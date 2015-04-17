class Question < ActiveRecord::Base
	    
	    belongs_to :exam
		has_many :answers, dependent: :destroy
		accepts_nested_attributes_for :answers, :allow_destroy => true
		validates :content, :presence => true
		has_one :userchoice
		belongs_to :result

end
