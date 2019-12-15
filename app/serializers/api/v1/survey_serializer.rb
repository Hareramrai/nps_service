module Api 
  module V1
    class SurveySerializer
      include FastJsonapi::ObjectSerializer
      
      attributes :id, :score, :touchpoint, :aasm_state, :created_at, :updated_at

      attribute :respondent, & ->(survey) { survey.respondentable } 
      attribute :requester, & ->(survey) { survey.requesterable }
    end
  end
end
