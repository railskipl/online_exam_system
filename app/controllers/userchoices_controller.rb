class UserchoicesController < ApplicationController

 def new
 	#@user_choice = Userchoice.new
 end

def create
	
	# raise params[:exam_id].inspect

	 @user_choices = Userchoice.new(choice_params)
	 raise @user_choices.inspect
	 @user_choices.save
end

private 

  def choice_params
 	  params.require(:userchoice).permit(:id, :exam_attributes => [:exam_id , :user_attributes => [:user_id, :questions_attributes => [:question_id, :answers_attributes => [:answer_id ]]]])
  end
end


# :questions_attributes => [:id, :exam_id, :content, :_destroy, :answers_attributes => [:id, :question_id, :correct_answer, :content, :_destroy]])