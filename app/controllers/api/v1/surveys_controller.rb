class Api::V1::SurveysController < Api::V1::BaseController
  before_action :find_survey, only: :update

  def index
    surveys = Api::V1::SurveyListFilter
      .new(Survey.includes(:respondentable, :requesterable))
      .call(params)

    json_pagination_response(surveys, Api::V1::SurveySerializer)
  end

  def update
    @survey.complete
    json_response(@survey.update!(survey_params))
  end

  private 

  def survey_params
    params.require(:survey).permit(:score)
  end

  def find_survey
    @survey = Survey.find params[:id]
  end
end