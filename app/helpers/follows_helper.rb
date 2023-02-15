module FollowsHelper 
    # def following_topic?(topic)
    #     current_user.topic.include?(topic)
    # end

    # def create(topic)

    #     Follow.create_or_find_by(user_id: current_user.id, topic_id: topic.id)
    #     flash[:alert] = "Topic is Followed"
    # end

    # def destroy(topic)
    #     Follow.where(user_id: current_user.id, topic_id: topic.id).destroy_all
    #     flash[:alert] = "Topic is unfollowed"
    # end 
end
