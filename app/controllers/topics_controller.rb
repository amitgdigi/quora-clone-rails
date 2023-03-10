class TopicsController < ApplicationController     
    before_action :authenticate_user!, only: [:new, :follow, :unfollow, :add_topic, :index, :remove_topic, :create, :destroy]
    before_action :set_topics, only: [:show, :edit]

    def new
        @topic = Topic.new
    end

    def follow
        @topic = Topic.find(params[:topic_id])
        @topic_follow = Follow.create(user_id: current_user.id, topic_id: @topic.id)
        if @topic_follow.save
            flash[:success] = "Topic is Followed/////"
        end
        respond_to do |format|
            
            format.html { redirect_to @topic }
            format.js {render layout: false}
            end
        # redirect_to topics_path
    end
    
    def unfollow
        @topic = Topic.find(params[:topic_id])
        @topic_follow = Follow.where(user_id: current_user.id, topic_id: @topic.id)
        puts @topic_follow
        unless @topic_follow.nil?
            @topic_follow.destroy_all
            flash[:success] = "Topic is unfollowed"
        end
        respond_to do |format|
            format.html { redirect_to @topic }
            format.js {render layout: false}
            # byebug
            end
        # redirect_to topics_path
    end 


    def add_topic
        byebug
        # question = Question.find(params[:question_id])
        # topic = Topic.find(params[:id])
        # @question_topics = QuestionTopic.create(question_id: question.id, topic_id: topic.id)
        # if @question_topics.save
        #     flash[:success] = "Topic added to Question"
        # else
        #     flash[:danger] = "Unable to add Topic to Question"
        # end
        # redirect_to question_path(question)
    end
    def remove_topic
        byebug
        # question = Question.find(params[:question_id])
        # topic = Topic.find(params[:id])
        # @question_topics = QuestionTopic.where(question_id: question.id, topic_id: topic.id)
        # unless @question_topics.nil?
        #     @question_topics.destroy_all
        #     flash[:success] = "Topic removed from Question"
        # else
        #     flash[:danger] = "Unable to remove Topic from Question"
        # end
        # redirect_to question_path(question)
    end

    def create 
            @topic = Topic.create(topic_params)
        if  @topic.save
            redirect_to @topic
            flash[:notice] = "topic is created"
        else
            render new_topic_path  
        end
    end

    def index            
        @topics = Topic.paginate(page: params[:page], per_page: 7)
    end

    def destroy
        @topic.destroy
        redirect_to @questions_path
    end

    private

    def set_topics
        @topic = Topic.find(params[:id])
    end

    def topic_params
        params.require(:topic).permit(:topic)
    end
end
