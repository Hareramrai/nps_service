FactoryBot.define do
  factory :survey do |survey|
    survey.score { 1.5 }
    survey.touchpoint { 'realtor_feedback' }
    survey.respondentable { |relation| relation.association(:seller) }
    survey.requesterable { |relation| relation.association(:realtor) }
  end
end
