class TopicsController < ApplicationController
    # before_action :check_topic
    before_action :set_topics, only: [:show, :edit]
    def new
        @topic = Topic.new
    end
    
    def create 
        # any = Topic.find_by(topic: params[:topic][:topic])
        # # puts 'any[:topic]'
        # # puts 'params[:topic][:topic]'
        # # puts params[:topic][:topic]
        # # # puts any[:topic] = nil?
        # # # puts any[:topic] .& params[:topic][:topic]
        # if any[:topic] == params[:topic][:topic]
        #     flash[:danger] = 'Topic is present'
        #     redirect_to root_path
        #     puts "topic is already present"
        # else 
            @topic = Topic.create(topic_params)
        if  @topic.save
            redirect_to @topic
            puts "Unique topic"
            flash[:notice] = "topic is created"
        else
            flash[:danger] = "null value or topic is already present"
            redirect_to root_path

        end
        
    end

    # def check_topic
    #     if Topic.all[:topic] == params[:topic]
    #         byebug
    #     end
    # end

    
    def index            
        @topics = Topic.all
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
