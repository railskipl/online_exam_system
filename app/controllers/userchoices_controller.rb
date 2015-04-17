class UserchoicesController < ApplicationController

 def new
 	 #@user = Result.new
 end

# def create
	
# 	# raise params[:exam_id].inspect

# 	@user_choices = Userchoice.new(choice_params)
# 	# raise params.inspect
# 	 # raise @user_choices.inspect
# 	@user_choices.save!
# end

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


def score
 raise userresult_params.inspect	
end



  



# private

# def userresult_params

# 	params.require(:result).permit(:id, :question_id, :answer_id, :userchoice_id)
# end

# def choice_params
#  	params.require(:userchoice).permit(:id, :exam_attributes => [:exam_id , :user_attributes => [:user_id, :questions_attributes => [:question_id, :answers_attributes => [:answer_id ]]]])
# end

#  #    @user = Result.new(user_params)
#  #      raise @user.inspect
# 	# if @user.save
# 	# 	redirect_to users_path
# 	# else
# 	# 	render :new
# 	# end	
# end



def score 

    #raise @paper.inspect

	user_params["question_id"].each do |i|
     @r = Result.new(user_params)
     r.question_id = i[0]
   #  @q = r.question_id
     r.answer_id = i[1] 
    # @a = r.answer_id

     r.save
	end

	redirect_to :back
    # @user = Result.new(user_params)
    
    # @user.save
 
end


# def check_answer
#     stage_score = 0
#     self.userchoices.each do |attempt|
#       if attempt.answer.correct? == true
#         stage_score += 1
#       elsif attempt.answer.correct == false
#         stage_score - 1
#       end
#     end
#     stage_score
#   end



private

def user_params

#params.require(:result).permit(:id , :question_id , :answer_id , :userchoice_id )


params.require(:result).permit!

end

 # def exam_params
 #      params.require(:exam).permit(:name, :questions_attributes => [:id, :exam_id, :content, :_destroy, :answers_attributes => [:id, :question_id, :correct_answer, :content, :_destroy]])
 #    end

# private 

# def choice_params		

#     params.require(:userchoice).permit(:id , :exam_id , :user_id ) 
#  	#params.require(:userchoice).permit(:id, :exam_attributes => [:exam_id , :user_attributes => [:user_id, :questions_attributes => [:question_id, :answers_attributes => [:answer_id ]]]])

# end


end


# :questions_attributes => [:id, :exam_id, :content, :_destroy, :answers_attributes => [:id, :question_id, :correct_answer, :content, :_destroy]])