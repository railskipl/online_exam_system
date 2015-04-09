class UserchoicesController < ApplicationController

# def new
# 	@user_choice = Userchoice.new
# end

# def create
	
# 	# raise params[:exam_id].inspect

# 	@user_choices = Userchoice.new(choice_params)
# 	# raise params.inspect
# 	 # raise @user_choices.inspect
# 	@user_choices.save!
# end

def create

   @user = params :results.values.collect { |result| Result.new(result) } 
	 if @results.all?(&:valid?) 
		@results.each(&:save!)
       redirect_to :action => ‘index’  
     
     else render :action => ‘new’
end 

 #    @user = Result.new(user_params)
 #       raise user_params.inspect
	# if @user.save
	# 	redirect_to users_path
	# else
	# 	render :new
	# end	
end

def score
raise user_params.inspect	
end




private

def user_params
	
	params.require(:result).permit(:id ,:question_id, :answer_id , :userchoice_id )

end



# private 

# def choice_params

#     params.require(:userchoice).permit(:id , :exam_id , :user_id ) 
#  	#params.require(:userchoice).permit(:id, :exam_attributes => [:exam_id , :user_attributes => [:user_id, :questions_attributes => [:question_id, :answers_attributes => [:answer_id ]]]])

# end

end


# :questions_attributes => [:id, :exam_id, :content, :_destroy, :answers_attributes => [:id, :question_id, :correct_answer, :content, :_destroy]])