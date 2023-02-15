class QuestionsController < ApplicationController
    before_action :authenticate_user! , only: [:new, :edit, :create, :destroy]
    before_action :set_question, only: [:edit, :show]
 
    def new
        @question = current_user.questions.build
    end

    def create 
        @question = current_user.questions.build(question_params)
        if @question.save
            flash[:success] = "Question is created"
            redirect_to questions_path
        else
            flash[:danger] = "Unable to create Question"
            redirect_to root_path
        end
    end

    def index
        @questions = Question.all
    end
    
    def show
        @question = Question.find(params[:id])
    end
    
    def edit
        @question = Question.find(params[:id])
    end

    def destroy
        @question = Question.find(params[:id])
        if @question.destroy
            redirect_to questions_path 
        end
    end



    private 
    def set_question
        @question = Question.find(params[:id])
    end

    

    def question_params
        params.require(:question).permit(:question)
    end

end
