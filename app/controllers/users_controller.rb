class UsersController < ApplicationController


def new
	@user = User.new
	#@user_result = Result.new

end

def create
    @user = User.new(user_params)

	if @user.save
		@current = @user.exam_id
		session[:exam_id] = @current
		redirect_to instruction_path
	else
		render :new
	end	
end
	




# def exam
	

#     @user = User.new(user_params)

# 	if @user.save
# 		@current = @user.exam_id
# 		session[:exam_id] = @current
# 		redirect_to instruction_path
# 	else
# 		render :new
# 	end	

#     # raise "hi"
#  #    @user_result = Result.new(userresult_params)
#  #       raise userresult_params.inspect
# 	# if @user_result.save
# 	# 	redirect_to users_path
# 	# else
# 	# 	render :new
# 	# end	
	
# end
	






def instruction 
   #raise session[:exam_id].inspect
end

def papers
	@paper = Exam.find(session[:exam_id]) rescue nil


	#raise @paper.inspect


	#session[:exam_id] = nil

	# @user = #@paper
	# @user = Result.new(choice_params)
	#variant = @paper
    #@result = Result.new
    #@result.variant = variant
   # @questions = Question.find(@paper)
    #raise @questions.inspect
    

	# @result = Result.new
 #    @questions = Question.where (variant: variant)
 #    @questions.each {|question| quiestion.answers.build}

end

def show
  
end
def result
	
end

# def score

#  @user = Result.new(choice_params)
#  @user.save
 
# end


# private

# def choice_params

# params.require(:result).permit(:id , :question_id , :answer_id , :userchoice_id )

# #params.require(:result).permit(:id , :question_attributes => [:question_id, :answer_attributes => [:answer_id , :userchoice_attributes => [:userchoice_id]]] )

# end


private

def user_params
	params.require(:user).permit(:firstname , :lastname, :email ,:dob , :contact , :address , :exam_id)
end

def userresult_params
	params.require(:result).permit(:id, :question_id, :answer_id, :userchoice_id)
end
end
