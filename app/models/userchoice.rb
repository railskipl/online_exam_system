class Userchoice < ActiveRecord::Base

belongs_to :question
belongs_to :user
belongs_to :exam
belongs_to :answers

 accepts_nested_attributes_for :answers 

end
