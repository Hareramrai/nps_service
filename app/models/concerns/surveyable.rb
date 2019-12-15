module Surveyable
  extend ActiveSupport::Concern

  included do
    has_many :respondent_surveys, as: :respondentable, dependent: :destroy, class_name: 'Survey'
    has_many :requester_surveys, as: :requesterable, dependent: :destroy, class_name: 'Survey'
  end
end
