class UserchoicesController < ApplicationController

def score 
      user_params["question_id"].each do |i|
      r = Result.new(user_params)
      r.question_id = i[0]
      r.answer_id = i[1] 
      #r.userchoice_id = session[:id]
      r.save
      end
    	redirect_to :back
      #redirect_to finish_path   
end


def evaluate
      
      result=Result.where(:userchoice_id=>session[:id])
            
            #raise session[:exam_id].inspect
      # Result.calculate_result(session[:exam_id])

 end





	private

		def user_params
		params.require(:result).permit!
		end
end



