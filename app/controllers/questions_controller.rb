class QuestionsController < ApplicationController
    before_action :authenticate_user! , only: [:new, :edit, :create, :destroy]
    before_action :set_question, only: [:edit, :show]
    def new
        @question = current_user.questions.build
    end

    def create
        @question = current_user.questions.build(question_params)
        if params[:items].nil?
            flash[:success] = "topic selection is mendatory"
            render 'new'
            # redirect_to new_question_path
        elsif @question.save   
            # checkbox_value = params[:items] && params[:items][:item_ids]
            checkbox_value = params[:items][:item_ids]
            puts checkbox_value
                checkbox_value.each do |item|
                        topic = Topic.find(item)
                    puts topic
                    QuestionTopic.create(topic_id: topic.id, question_id: @question.id)
                end
            flash[:success] = "Question with topic is created"
            redirect_to question_path(@question)
        else
            flash[:danger] = "Unable to create Question"
            render 'new'
        end
    end

    def index
        # @questions = Question.all
        @questions = Question.order(created_at: :desc).paginate(page: params[:page], per_page: 10)

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
        params.require(:question).permit(:question, topic_id: [])
    end

end
