class UsersController < ApplicationController

helper_method :pretty_date_time
before_filter :authenticate, :except => [:new,:edit, :create , :update , :destroy , :papers , :instruction]

def authenticate
 if adminsection_signed_in? 
    
    else
    	redirect_to root_path
 end
end

def index
	@users = User.order(:firstname).paginate(:page => params[:page] ,:per_page => 5)
end

def new
	@user = User.new
end

def create
    @user = User.new(user_params)

	if @user.save
		@session_user_id = @user.id
		session[:id] = @session_user_id
		@current = @user.exam_id
		session[:exam_id] = @current
		redirect_to instruction_path
	else
		render :new
	end	
end

def edit 
	
	@user = User.find(params[:id])

end
def update 
	@user = User.find(params[:id])
	respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to instruction_path, notice: 'Your Details was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
end

def papers

		@paper = Exam.find(session[:exam_id]) rescue nil
    @questions = @paper.questions#.paginate(:page => params[:page] ,:per_page => 2)
    #raise @paper.inspect
	  		if @paper.starttime.nil?
        		@paper.starttime=Time.zone.now
        		@paper.save
      	end

        	if @paper.timing==0
          		@time=-1
      		else

          		@min=@paper.timing-((Time.zone.now-@paper.starttime)/60).to_i
          		@sec=((Time.zone.now-@paper.starttime)%60).to_i
        		  @time=1
       			 if @min > @paper.timing || @min <= 0
         		    @time=0
             end  
 			    end
end

def instruction 
    @test=Exam.find(session[:exam_id])
    @candidate=User.find(session[:id])
end


def show
  @user = User.find(params[:id])
end

 def destroy
 	@user = User.find(params[:id])
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_path, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



def result
	
end

private

	def user_params
		params.require(:user).permit(:id, :firstname , :lastname, :email ,:dob , :contact , :address , :exam_id)
	end

end
