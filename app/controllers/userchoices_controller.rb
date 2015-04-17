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
raise params.inspect
#    @user = params :results.values.collect { |result| Result.new(result) } 
# 	 if @results.all?(&:valid?) 
# 		@results.each(&:save!)
#        redirect_to :action => ‘index’  
     
#      else render :action => ‘new’
# end 
 #    @user = Result.new(user_params)
 #      raise @user.inspect
	# if @user.save
	# 	redirect_to users_path
	# else
	# 	render :new
	# end	
end

def score 

   #raise user_params.inspect

	user_params["question_id"].each do |i|
     r = Result.new(user_params)
     r.question_id = i[0]
     r.answer_id = i[1] 
     #r.userchoice_id = session[:id]
     r.save
	end
	redirect_to :back
    # @user = Result.new(user_params)
    
    # @user.save
 
end


def results_as_set_of_8(user, range)
    score = 0
     self.questions[range].each_with_index do |q, qi|
       q.choices.each_with_index do |c, ci|
         if c.id == user.answers[range.first + qi].choice_id
           score += ci +5 - (2*ci)
         end
       end
     end
     return score/8.0
  end

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