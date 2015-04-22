class UsersController < ApplicationController

helper_method :pretty_date_time


def index

	@users = User.order(:firstname).paginate(:page => params[:page] ,:per_page => 5)
end

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
	@questions = @paper.questions #.paginate(:page => params[:page] ,:per_page => 2)
	#raise @paper.inspect
	#@paper.starttime = nil
		@paper.starttime = nil
	  	if @paper.starttime.nil?
	  	#raise @paper.inspect
	  	#raise Time.now.inspect	
        @paper.starttime = Time.zone.now #.strftime "%d-%m-%Y %H:%M:%S"
 		#raise @paper.starttime.inspect
        @paper.save
       
      	 end

        if @paper.timing==0
          @time=-1
          #raise @time.inspect
      	else
      		#raise @paper.inspect
         # @min= @paper.timing-((Time.now-@paper.starttime)/60).to_i

          @min=@paper.timing-((Time.zone.now-@paper.starttime)/60).to_i

          #raise @min.inspect
          @sec=((Time.zone.now-@paper.starttime)%60).to_i
          #raise @sec.inspect
        @time=1
        if @min > @paper.timing || @min <= 0
          @time=0

        end
    
 		end

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
