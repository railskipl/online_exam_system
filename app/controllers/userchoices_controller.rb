class UserchoicesController < ApplicationController




 def new
 	 #@user = Result.new
 end


def create


	 # @user_choices = Userchoice.new(choice_params)
	 # raise @user_choices.inspect
	 # @user_choices.save


raise params.inspect

#    @user = params :results.values.collect { |result| Result.new(result) } 
# 	 if @results.all?(&:valid?) 
# 		@results.each(&:save!)
#        redirect_to :action => ‘index’  
     
#      else render :action => ‘new’
# end 


    @user = Result.new(userresult_params)
       raise userresult_params.inspect
	if @user.save
		redirect_to users_path
	else
		render 'new'
	end	
end

 def finish  
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


    @u_result = ( @count *  100 ) / @no_of_question 
             #raise u_result.inspect

#return @count
#raise @count.inspect
  redirect_to "/finish?@count=#{@count}&@u_result=#{@u_result}"


    # @user = Result.new(user_params)
    
    # @user.save
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



