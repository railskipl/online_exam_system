class Result < ActiveRecord::Base

has_many   :userchoice
has_many :question
#has_many :answer

accepts_nested_attributes_for :question

accepts_nested_attributes_for :userchoice

end
