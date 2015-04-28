class Exam < ActiveRecord::Base
	
	has_many :questions, dependent: :destroy
	has_many :users
	has_many :userchoices
	belongs_to :results
	accepts_nested_attributes_for :questions, :allow_destroy => true
	validates :name, :presence => true
    accepts_nested_attributes_for :userchoices
	accepts_nested_attributes_for :results
 
  validate :any_present?

def any_present?
  if questions.all?{|attr| self[attr].present?}
    errors.add :base, " Atleast 1 question should be present "
  end
end


end
