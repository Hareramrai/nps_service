require 'rails_helper'

RSpec.describe 'Surveys API', type: :request do

  let(:headers) { { "Content-Type" => "application/json" } }

  describe 'GET api/v1/surveys' do
    let(:survey1) { create(:survey, touchpoint: 'realtor_feedback_1') }
    let(:survey2) { create(:survey, touchpoint: 'realtor_feedback_2') }

    context 'when called without any params' do 
      before { get api_v1_surveys_url, headers: headers }

      it 'returns status code 400' do
        expect(response).to have_http_status(400)
      end

      it 'returns error message' do
        expect(json['error']).to eq('Touchpoint is required!')
      end
    end


    context 'when called with touchpoint' do 
      before { get api_v1_surveys_url(touchpoint: survey1.touchpoint) }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns all survey with given touchpoint' do
        expect(json).to eq(Api::V1::SurveySerializer.new([survey1]).as_json)
      end
    end
  end


  describe 'PATCH api/v1/survey/:id' do
    let!(:survey) { create(:survey, touchpoint: 'realtor_feedback') }
    let(:attributes) { { survey: { score: score } } }

    before {
      patch api_v1_survey_url(survey.id), params: attributes.to_json, headers: headers
    }

    context 'when the record exists' do
      let(:score) { 8 }

      it 'updates the record' do
        expect(response.body).not_to be_empty
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when score in not in range' do
      let(:score) { 88 }

      it 'returns status code 404' do
        expect(response).to have_http_status(422)
      end

      it 'returns validation error message' do
        expect(json['error']).to eq('Validation failed: Score must be less than or equal to 10')
      end
    end
  end
end