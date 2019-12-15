class Api::V1::SurveyListFilter
  attr_accessor :scope

  def initialize(initial_scope)
    @scope = initial_scope
  end

  def call(params)
    scope = filter_by_touchpoint(params[:touchpoint])
    scope = filter_by_respondent(params[:respondent])
    scope = filter_by_requester(params[:requester])
    scope
  end

  private

  def filter_by_touchpoint(touchpoint)
    return raise Exceptions::ParamsMissingError.new('Touchpoint is required!') unless touchpoint
    
    scope.where(touchpoint: touchpoint)
  end

  def filter_by_respondent(respondent)
    return scope unless respondent

    scope.where(respondentable_type: respondent)
  end

  def filter_by_requester(requester)
    return scope unless requester

    scope.where(requesterable_type: requester)
  end
end