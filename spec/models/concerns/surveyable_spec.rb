shared_examples 'surveyable' do
  it { is_expected.to have_many(:respondent_surveys) }
  it { is_expected.to have_many(:requester_surveys) }
end