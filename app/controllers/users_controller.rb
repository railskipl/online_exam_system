class UsersController < ApplicationController

def new
	@user = User.new
end

def create
@user = User.new(user_params)

if @user.save
	redirect_to instruction_path
else
	render :new
end	
end

<<<<<<< HEAD
	
=======
def instruction
	
end
>>>>>>> 4574f83de676e2ff9aca7b1a3a92f48cd7e24ef0

private

def user_params
	params.require(:user).permit(:firstname , :lastname, :email ,:dob , :contact , :address)
end

end
