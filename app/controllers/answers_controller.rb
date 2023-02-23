class AnswersController < ApplicationController
    before_action :authenticate_user!, only: [:create, :show, :destroy]

    def create
        @question = Question.find(params[:question_id])
        byebug
        @answer = @question.answers.create(answer_params)
        @answer.user = current_user
        if @answer.save
            if @answer.attachment.attached?
                # (params[:answer][:attachment])
                attachment =(params[:answer][:attachment])
                @attach = Attachment.create(answer_id: @answer.id , attachment: attachment)
                if @attach.save
                    attachment_danger = 'attachement is saved'
                else
                    attachment_danger = 'Unable to save attachment'
                end 
            end 
            flash[:success] = "Answer is saved #{attachment_danger if attachment_danger}"
            # redirect_to question_answer_path(@answer)
            # q_id = params[:question_id]
            # redirect_to question_answer_path(@answer, q_id)
            redirect_to question_answer_path(@question,@answer)
        else
            flash[:danger] = "Unable to save Your Answer, Please try again #{attachment_danger if attachment_danger}"
            redirect_to question_path(@question)
            # render question_path(@question)
            # render action: "create"
            # return respond_to do |format|
            #     format.html { render :create, status: :unprocessable_entity }
            #   end
            # render 'create'
        end
        
    end

    def show
        @question = Question.find(params[:question_id])
        @answer = @question.answers.find(params[:id])
    end

    def index
        byebug
        @answers = @question.answers.paginate(page: params[:page], per_page: 5)
    end

    def destroy
        @answer = Answer.find(params[:id])
        if @answer.destroy
        redirect_to root_path
        end
    end

    private

    def answer_params
        params.require(:answer).permit(:answer, :attachment)
    end
end
