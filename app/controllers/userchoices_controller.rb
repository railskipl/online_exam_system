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
   if question_id.nil?
     redirect_to :back
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

@uid = user_params[:userchoice_id]
#raise @uid.inspect
uid = User.find(@uid)

#uid.save
    @u_result = ( @count *  100 ) / @no_of_question
#u_examid = uid.exam_id
u_percent =uid.percent
u_percent = @u_result
uid.percent = u_percent

 #raise uid.percent.inspect

u_correct =uid.no_of_correct_answer
u_correct = @count
uid.no_of_correct_answer = u_correct

#raise uid.no_of_correct_answer.inspect
# uid.exam_id = @u_examid 
 uid.save

  redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}"

   end

  
end


private

def user_params

params.require(:result).permit!

end
 
end


