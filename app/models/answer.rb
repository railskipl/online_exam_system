class Answer < ActiveRecord::Base

	
	belongs_to :questions

	belongs_to :question

	validates :content, :presence => true
	belongs_to :result

def duplicate_answer?
  if answers.all?{|attr| self[attr].present?}
    errors.add :base, "Answer should be present "
  end
end
end

