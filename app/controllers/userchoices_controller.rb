class UserchoicesController < ApplicationController




def score 

   #raise user_params.inspect

	user_params["question_id"].each do |i|
     r = Result.new(user_params)
     r.question_id = i[0]
     r.answer_id = i[1] 
     #r.userchoice_id = session[:id]
     r.save
	end

                            
	

	redirect_to finish_path

    # @user = Result.new(user_params)
    
    # @user.save
 
end


def evaluate
     
 @result=Result.where(:userchoice_id=>session[:id])
#raise Result.userchoice_id.inspect




raise @result.inspect
  #   if !@result.completed
  #     answers=params[:answer]
  #     answers.each do |qn,ans|
  #       if ans!=-1
  #         a=CandidateAnswer.find(qn)
  #         a.answer_id=ans
  #         a.save
  #       end
  #     end
  #     @result.calculate_result(session[:test_id])
  #     redirect_to :action=>'finish',:candidate_id=>session[:candidate_id]
  #   else
  #     flash[:warning]="Please enter test from home!"
  #     redirect_to root_url
  #   end
 end



	private

		def user_params
		params.require(:result).permit!
		end
end



