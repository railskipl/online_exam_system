class UsersController < ApplicationController


def new
	@user = User.new
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
	

def instruction 
   #raise session[:exam_id].inspect
end

def papers
	@paper = Exam.find(session[:exam_id]) rescue nil
	session[:exam_id] = nil
end

def show
  
end


private

def user_params
	params.require(:user).permit(:firstname , :lastname, :email ,:dob , :contact , :address , :exam_id)
end

end
