class Result < ActiveRecord::Base

#attr_accessible :trueoption


has_many   :userchoice
has_many   :question
has_many   :answer
belongs_to :exam

accepts_nested_attributes_for :question

accepts_nested_attributes_for :userchoice

  #  def self.calculate_result(test_id)

  #  	  #answers  = Result.where(:userchoice_id => self.userchoice_id)
  #      #  raise userchoice_id.inspect
  # #    answers= Result.where(:candidate_id=>self.candidate_id)
  #    test=Exam.find(test_id)
  #   # raise test.inspect
  #     #raise 
  # # #    correct=0
  # # #    incorrect=0
  # # #    unanswered=0
  # # #    score=0.0
  # # #    c_score=test.correct_score
  # # #    w_score=test.wrong_score
  # # #    #negative_marking=test.negative_marking
  # # #    answers.each do |ans|
  # # #     if ans.answer_id ==-1
  # # #       unanswered+=1

  # # #     elsif ans.answer_id==ans.test_question.question.correct_answer.id
  # # #       correct+=1
  # # #       score+=c_score
  # # #     else
  # # #       incorrect+=1
  # # #       score-=w_score
  # # #     end
  # # #    end
  # # #    self.no_correct=correct
  # # #    self.no_incorrect=incorrect
  # # #    self.no_unanswered=unanswered
  # # #    self.score=score
  # # #    self.completed=true
  # # #    self.save
  # #raise "hi"
  #   end

end 