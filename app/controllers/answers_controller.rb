class AnswersController < ApplicationController
    before_action :authenticate_user!, only: [:create, :show, :destroy]
    before_action :set_answer, only: [:destroy]

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.create(answer_params)
        @answer.user = current_user
        if @answer.save 
            flash[:success] = "Answer is saved "
            redirect_to question_answer_path(@question,@answer)
        else
            flash[:danger] = "Unable to save Your Answer, Please try again "
            redirect_to question_path(@question)
        end
        
    end

    def show
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
    end

    def index
        byebug
        @answers = @question.answers.paginate(page: params[:page], per_page: 5)
    end
# 
# edit answer
# update answer
# votable answer
# chain commentable
#  
#     
    def destroy
        if @answer.destroy
        redirect_to root_path
        end
    end

    private
    def set_answer
        @answer = Answer.find(params[:id])
    end

    def answer_params
        params.require(:answer).permit(:answer, :attachment)
    end
end
