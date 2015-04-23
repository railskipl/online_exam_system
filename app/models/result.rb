class Result < ActiveRecord::Base

has_many   :userchoice
has_many   :question
has_many   :answer
belongs_to :exam

accepts_nested_attributes_for :question

accepts_nested_attributes_for :userchoice

end 