class Question < ActiveRecord::Base
	    
	    belongs_to :exam
		has_many :answers, dependent: :destroy
		accepts_nested_attributes_for :answers, :allow_destroy => true
		validates :content, :presence => true
		has_many :userchoice
		has_one :result
		accepts_nested_attributes_for :userchoice
		
  validate :any_present?

def any_present?
  if answers.all?{|attr| self[attr].present?}
    errors.add :base, "Answer should be present "
  end
end




end
