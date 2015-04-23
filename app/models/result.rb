class Result < ActiveRecord::Base

#attr_accessible :trueoption


has_many   :userchoice
has_many   :question
has_many   :answer
belongs_to :exam

accepts_nested_attributes_for :question

accepts_nested_attributes_for :userchoice

  

end 