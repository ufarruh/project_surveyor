class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @survey.questions.build
  end

  def index
    @surveys = Survey.all
  end

  def show
    @survey = Survey.find(params[:id])
  end

  def create
    @survey = Survey.new(whitelisted_params)

    if @survey.save
      redirect_to new_survey_question_path(survey_id: @survey.id)
    else
      render "new"
    end
  end

  private
  def whitelisted_params
    params.require(:survey).permit(:title, :description, questions_attributes: [:id, :title, :survey_id]  )
  end
end
