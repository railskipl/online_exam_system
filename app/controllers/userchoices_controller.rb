class UserchoicesController < ApplicationController




 def new
   #@user = Result.new
 end



def finish 
@paper = Exam.find(session[:exam_id]) rescue nil
@paper.starttime = nil
@paper.save
#raise @paper.inspect
session[:exam_id] = nil
session[:id] = nil

end


def score 
  
  count = 0
  #raise user_params["question_id"].inspect
  question_id = user_params["question_id"]

  
  if question_id.nil?
       @count = 0
       @u_result = 0
       
       redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}"

   else
      user_params["question_id"].each do |i|
      r = Result.new(user_params)
      r.question_id = i[0]
      r.answer_id = i[1]
      #raise r.question_id.inspect
      #raise r.answer_id.inspect 
      #raise r.userchoice_id.inspect
     usr = User.find(r.userchoice_id)
     exm = usr.exam_id
     ans = Question.find(r.question_id)  
     que = Exam.find(exm)

      no_of_question = que.questions.count

     @no_of_question = no_of_question
     #raise no_of_question.inspect
      cor_ans = ans.answers.each do |ss|
        # cor_ans =ans.answers
        # raise cor_ans.inspect
        if ss.correct_answer?
           cor_id = ss.id 
           if r.answer_id == cor_id
              
              count = count + 1 
              #raise count.inspect
            else
              count = count 
                 
            end
              
            @count =  count
            #raise @count.inspect
           
        end
        
      end
 
     r.save
  end
     #raise @count.inspect
     @u_result = ( @count *  100 ) / @no_of_question 
     #raise @u_result.inspect


   
             
  redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}"

   end 
  
end


private

def user_params

params.require(:result).permit!

end



 
end
