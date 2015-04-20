class UsersController < ApplicationController


def new
	@user = User.new
	#@user_result = Result.new

end

def create
    @user = User.new(user_params)

	if @user.save
		@session_user_id = @user.id
		#raise @session_user_id.inspect
		session[:id] = @session_user_id
		#raise session[:id].inspect
		@current = @user.exam_id
		session[:exam_id] = @current
		redirect_to instruction_path
	else
		render :new
	end	
end


def instruction 
   #raise session[:exam_id].inspect
end

def papers

	@paper = Exam.find(session[:exam_id]) rescue nil
	    
	    # @paper.starttime = nil
	  	if @paper.starttime.nil?
        @paper.starttime=Time.now
        @paper.save
        raise @paper.inspect
      	 end

        if @paper.timing==0
          @time=-1
          #raise @time.inspect
      	else
          @min = @paper.timing-((Time.now-@paper.starttime)/60).to_i
          #raise @min.inspect
          @sec=((Time.now-@paper.starttime)%60).to_i
          #raise @sec.inspect
        @time=1
        if @min > @paper.timing || @min <= 0
          @time=0
        end
     
 		end
end


def show
  
end


def result
	
end


private

	def user_params
		params.require(:user).permit(:id, :firstname , :lastname, :email ,:dob , :contact , :address , :exam_id)
	end




end
