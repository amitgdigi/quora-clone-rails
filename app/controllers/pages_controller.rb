class PagesController < ApplicationController 
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
end
