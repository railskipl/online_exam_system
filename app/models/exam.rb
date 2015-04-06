class Exam < ActiveRecord::Base
	has_many :questions, dependent: :destroy
	has_many :users
	accepts_nested_attributes_for :questions, :allow_destroy => true
	validates :name, :presence => true
end
