class QuestionsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :destroy]
    before_action :set_question, only: [:edit, :show]
    # before_action :set_topics
 
    def new
        @question = current_user.questions.build
    end

    def create 
        # @user = current_user
        @question = current_user.questions.build(question_params)
        if @question.save
            flash[:success] = "Question is created"
            # redirect_to @question
            redirect_to questions_path
            # redirect_to question_path(@question)
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

    # def set_topics
    #     @topics = Topic.all
    # end

    private 
    def set_question
        @question = Question.find(params[:id])
    end

    

    def question_params
        params.require(:question).permit(:question, :topic_id)
    end

end
