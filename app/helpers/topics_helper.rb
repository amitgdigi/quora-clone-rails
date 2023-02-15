module TopicsHelper
    def following_topic?(topic)
        # topic = Topic.find(params[:topic_id])
        follow_topic = Follow.find_by(user_id: current_user.id, topic_id: topic.id)
        puts "follow_topic"
        puts !!follow_topic
        return !!follow_topic
    end

    def topic_added?(question, topic)
        added = QuestionTopic.find_by(question_id: question.id, topic_id: topic.id)
        puts "added"
        puts !!added
        return !!added
    end
end
