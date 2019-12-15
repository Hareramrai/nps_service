require 'rails_helper'

RSpec.describe Api::V1::SurveyListFilter do 
  let(:seller) { create(:seller) }
  let(:realtor) { create(:realtor) }

  let(:realtor_feedback_survey1) { create(:survey, touchpoint: 'realtor_feedback_1') }
  let(:realtor_feedback_survey2) { create(:survey, touchpoint: 'realtor_feedback_2') }

  let(:seller_feedback_survey1) do
    create(
      :survey, respondentable: realtor, requesterable: seller,
      touchpoint: 'seller_feedback_1'
    ) 
  end


  describe '.call' do
    let(:survey_list_filter) { described_class.new(Survey.all) }

    context 'when missing params' do 
      it 'raise param missing error' do
        expect { survey_list_filter.call({}) }.to raise_error(Exceptions::ParamsMissingError)
      end 
    end

    context 'when passing touchpoint' do
      it 'returns filtered result by touchpoint' do
        result = survey_list_filter.call({touchpoint: 'seller_feedback_1'})

        expect(result).to eq([seller_feedback_survey1])
      end
    end


    context 'when passing respondent class' do
      it 'returns filtered result by respondent class' do
        result = survey_list_filter.call({respondent: 'Seller', touchpoint: 'realtor_feedback_1'})

        expect(result).to eq([realtor_feedback_survey1])
      end
    end

    context 'when passing requester class' do 
      it 'returns filtered result by requester class' do
        result = survey_list_filter.call({requester: 'Seller', touchpoint: 'seller_feedback_1'})

        expect(result).to eq([seller_feedback_survey1])
      end
    end

  end

end