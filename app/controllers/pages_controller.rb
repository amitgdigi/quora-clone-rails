class PagesController < ApplicationController 
    before_action :authenticate_user!, only: [:add_user, :remo_user]
    def user_questions
        @ques = current_user.questions.paginate(page: params[:page], per_page: 10)
    end

    def user_answers
        @ans = current_user.answers.paginate(page: params[:page], per_page: 10)
    end

    def userss 
        @users = User.paginate(page: params[:page], per_page: 5)
    end

    def add_user
        @user = User.find(params[:id])
        @added_user = Relationship.create(following_id: current_user.id, followed_id: @user.id)
        if @added_user.save
            flash[:success] = "You are following #{@user.name}"
        else
            flash[:danger] = "unable to follow #{@user.name}"
        end
        respond_to do |format|
            format.html {redirect_to @user} 
            format.js {render layout: false}
        end
    end

    def remo_user
        @user = User.find(params[:id])
        @added_user = Relationship.where(following_id: current_user.id, followed_id: @user.id)
        unless @added_user.nil?
            @added_user.destroy_all
            flash[:success] = "unfollowed #{@user.name}"
        else
            flash[:danger] = "unable to unfollow #{@user.name}"
        end
        respond_to do |format|
            format.html {redirect_to @user} 
            format.js {render layout: false}
        end
    end
    
end
