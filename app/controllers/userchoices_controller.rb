class UserchoicesController < ApplicationController

def finish 
@paper = Exam.find(session[:exam_id]) rescue nil
@paper.starttime = nil
@paper.save
session[:exam_id] = nil
session[:id] = nil
end

def score 
  count = 0
  #raise user_params["question_id"].inspect
  question_id = user_params["question_id"]
  exam_id = user_params["exam_id"].to_i
 
  if question_id.nil?
       @count = 0
       @u_result = 0
       cur_exm_id = Exam.find(exam_id)
       @no_of_question = cur_exm_id.questions.count    
       redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}&@no_of_question=#{@no_of_question}"

   else
      user_params["question_id"].each do |i|
      r = Result.new(user_params)
      r.question_id = i[0]
      r.answer_id = i[1]
      usr = User.find(r.userchoice_id)
      exm = usr.exam_id
      ans = Question.find(r.question_id)  
      que = Exam.find(exm)

      no_of_question = que.questions.count
      @no_of_question = no_of_question

      cor_ans = ans.answers.each do |ss|
        if ss.correct_answer?
           cor_id = ss.id 
             if r.answer_id == cor_id
                count = count + 1 
            else
                count = count      
            end  
            @count =  count
          end        
      end
     r.save
  end
     
      @u_result = ( @count *  100 ) / @no_of_question 
      @uid = user_params[:userchoice_id]
      uid = User.find(@uid)
       
      u_percent =uid.percent
      u_percent = @u_result
      uid.percent = u_percent

      u_correct =uid.no_of_correct_answer
      u_correct = @count
      uid.no_of_correct_answer = u_correct

      u_tot_que =uid.no_of_questions
      u_tot_que = @no_of_question
      uid.no_of_questions = u_tot_que

      uid.save

      redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}&@no_of_question=#{@no_of_question}"

   end
end

      private
       def user_params
          params.require(:result).permit!
       end

end


