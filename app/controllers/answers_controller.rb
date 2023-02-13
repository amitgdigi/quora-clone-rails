class AnswersController < ApplicationController
    before_action :authenticate_user!, only: [ :create , :destroy]

    # def new
    #     @answer = Answer.new
    #     # @questions = Question.all 
    # end

    def create
        @question = Question.find(params[:question_id])
        @answer = @question.answers.create(answer_params)
        @answer.user = current_user
        if @answer.save
            flash[:save] = 'Answer is saved'
            # redirect_to question_answer_path(@answer)
            # q_id = params[:question_id]
            # redirect_to question_answer_path(@answer, q_id)
            redirect_to question_answer_path(@question,@answer)
        else
            flash[:danger] = 'Please try again'
            redirect_to 'new'
        end
        
    end

    def show
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
    end

    def index
        @answers = @question.answers.all
    end

    def destroy
        @answer = Answer.find(params[:id])
        if @answer.destroy
        redirect_to root_path
        end
    end

    private

    def answer_params
        params.require(:answer).permit(:answer)
    end
end
