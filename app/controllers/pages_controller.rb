class PagesController < ApplicationController 
    before_action :authenticate_user!
    def user_questions
        @user = current_user
        @ques = @user.questions.all
    end

    def user_answers
        # byebug
        @user = current_user
        @ans = @user.answers.all
        # byebug
    end
    # def topic_questions
    #     byebug
    #     # topic
    #     # @top_ques = topic.question_topics
    #     # QuestionTopic.where(question_id: question.id)
    #     # question.question_topics.all

    # end
    def userss
        puts "hello"
        puts "hello"
      @users = User.all
    end

    def add_user
        user = User.find(params[:id])
        @added_user = Relationship.create(following_id: current_user.id, followed_id: user.id)
                    # <Relationship id: nil, following_id: nil, followed_id: nil>
        if @added_user.save
            flash[:success] = "You are following #{user.name}"
        else
            flash[:danger] = "unable to follow #{user.name}"
            byebug
        end
        puts "hello"
        puts "hello"
        puts user
        redirect_to userss_path
    end

    def remo_user
        user = User.find(params[:id])
        @added_user = Relationship.where(following_id: current_user.id, followed_id: user.id)
        # <Relationship id: nil, following_id: nil, followed_id: nil>
        unless @added_user.nil?
            @added_user.destroy_all
            flash[:success] = "unfollowed #{user.name}"
        else
            flash[:danger] = "unable to unfollow #{user.name}"
            byebug
        end
        puts "hello"
        puts "hello"
        puts user.name
        redirect_to userss_path
    end
    
end
