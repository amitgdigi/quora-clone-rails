class FollowsController < ApplicationController
    include FollowsHelper
   before_action :user_signed_in?
    def show
    end

    def follow
        byebug
        topic = Topic.find(params[:id])
        Follow.create_or_find_by(user_id: current_user.id, topic_id: topic.id)
        flash[:alert] = "Topic is Followed"
    end

    def destroy
        Follow.where(user_id: current_user.id, topic_id: topic.id).destroy_all
        flash[:alert] = "Topic is unfollowed"
    end 
    def index
    end
end
