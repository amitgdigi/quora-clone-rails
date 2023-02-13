class TopicsController < ApplicationController
    before_action :set_topics, only: [:show, :edit]
    def new
        @topic = Topic.new
    end
    
    def create
        byebug
        @topic = Topic.create(topic_params)
        if @topic.save
            redirect_to @topic
        else
            render "new"
        end
        
    end
    
    def index            
        @topics = Topic.all
    end

    def update
    end
    private

    def set_topics
        @topic = Topic.find(params[:id])
    end

    def topic_params
        params.require(:topic).permit(:topic)
    end
end
