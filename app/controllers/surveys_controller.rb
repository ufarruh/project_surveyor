class SurveysController < ApplicationController
  def new
    @survey = Survey.new
  end

  def create
    @survey = Survey.new(whitelisted_params)

    if @survey.save
      redirect_to surveys_path
    else
      render "new"
    end
  end

  private
  def whitelisted_params
    params.require(:survey).permit(:title, :description)
  end
end
