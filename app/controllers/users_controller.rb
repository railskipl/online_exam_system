class UsersController < ApplicationController

def new
	@user = User.new
end

def create
@user = User.new(user_params)

if @user.save

	 @current = @user.exam_id

	 redirect_to instruction_path(@current)
        # raise @current.inspect
	# @current=@user.exam_id
 #      raise @current.inspect
	# redirect_to instruction_path()

else
	render :new
end	
end
	

def instruction

   
end

def show

end
def exam
	
end


private

def user_params
	params.require(:user).permit(:firstname , :lastname, :email ,:dob , :contact , :address , :exam_id)
end

end
