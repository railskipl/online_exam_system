class UserchoicesController < ApplicationController

 def new

 end

def finish  
   @paper = Exam.find(session[:exam_id]) rescue nil
   @paper.starttime = nil
   @paper.save
end







def score 
  
  count = 0
  
  question_id = user_params["question_id"]
  
  if question_id.nil?
    raise "hi"

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


    @u_result = ( @count *  100 ) / @no_of_question 
  redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}"
   end 
	
end


private

def user_params

#params.require(:result).permit(:id , :question_id , :answer_id , :userchoice_id )


params.require(:result).permit!

end


def userresult_params
  params.require(:result).permit(:id, :question_id, :answer_id, :userchoice_id)
end

 
end



