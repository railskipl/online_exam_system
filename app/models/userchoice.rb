class Userchoice < ActiveRecord::Base

belongs_to :user
belongs_to :exam
belongs_to :result 
 
 accepts_nested_attributes_for :result 

end
