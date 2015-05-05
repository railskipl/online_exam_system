class ExamsController < ApplicationController
  before_action :set_exam, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_adminsection!
  # GET /exams
  # GET /exams.json
  def index
    @exams = Exam.all.paginate(:page => params[:page] ,:per_page => 5)
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
   @questions = @exam.questions.paginate(:page => params[:page] ,:per_page => 15)
  end

#  @answer = @question.answers.new(question_params[:answers_attributes]["#{i}"])
#@question.quiz_id = @quiz.id
 
  # GET /exams/new
  def new
        @exam = Exam.new
       1.times do
            question = @exam.questions.build
            4.times { question.answers.build }
              end
  end

  # GET /exams/1/edit
  def edit
    
  end

  def create
    @exam = Exam.new(exam_params)
    respond_to do |format|
      if @exam.save #&& Answer.where(exam_id: @question.id).where(correct: true).count != 1
        format.html { redirect_to @exam, notice: 'Exam was successfully created.' }
        format.json { render :show, status: :created, location: @exam }
      else
        format.html { render :new }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exams/1
  # PATCH/PUT /exams/1.json
  def update
    respond_to do |format|
      if @exam.update(exam_params)
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam }
      else
        format.html { render :edit }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @exam.destroy
    respond_to do |format|
      format.html { redirect_to exams_url, notice: 'Exam was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam
      @exam = Exam.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_params
      params.require(:exam).permit(:name,:timing , :starttime , :status, :questions_attributes => [:id, :exam_id, :content, :_destroy, :answers_attributes => [:id, :question_id, :correct_answer, :content, :_destroy]])
    end
end
