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
end
