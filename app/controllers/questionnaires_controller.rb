class QuestionnairesController < ApplicationController
  before_action :authenticate_user!
  before_action :responses_params, only: [:create, :update]
  before_action :questionnaire_params, only: [:edit, :show]

  def index
    @questionnaires = current_user.questionnaires.to_a
    @responses
  end

  def edit
    @questionnaire = Questionnaire.find(params[:id])
  end

  def new
    @questionnaire = Questionnaire.new
    @response = current_user.responses
  end

  def show
    @questionnaire = Questionnaire.find(params[:id])
  end

  def create
    @responses = Response.new(responses_params)

    if @responses.save
      current_user.responses << @responses
      redirect_to user_questionnaire_path(id: @questionnaire.id, user_id: current_user.id)
    else
      redirect_to user_questionnaires_path
    end
  end

  def update
    #
  end

  private
    def questionnaire_params
      params.require(:questionnaire).permit(:id)
    end

    def responses_params
      params.require(:response).permit(:response_text, :question_id)
    end
end
