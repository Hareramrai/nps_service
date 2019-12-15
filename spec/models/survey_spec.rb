require 'rails_helper'
RSpec.describe Survey, type: :model do

  it_behaves_like 'undeleted record not visible'

  describe 'validations' do

    it { should validate_presence_of(:score) }

    it { 
      should validate_numericality_of(:score)
        .is_greater_than_or_equal_to(0)
        .is_less_than_or_equal_to(10)
     }
  end

  describe 'relationships' do
    it { is_expected.to belong_to(:respondentable) }
    it { is_expected.to belong_to(:requesterable) }    
  end

  describe '#complete' do 
    let(:survey) { build(:survey) }

    context 'when initial state was pending' do 
      before { survey.aasm_state = 'pending' }

      it 'changes the status to completed' do
        survey.complete

        expect(survey.aasm_state).to eq('completed')
      end
    end

    context 'when initial state was other than pending' do 
      before { survey.aasm_state = 'completed' }

      it 'raise the exception' do
        expect { survey.complete }.to raise_error(AASM::InvalidTransition)
      end
    end

  end

  describe '#expire' do
    let(:survey) { build(:survey) }

    context 'when initial state was pending' do 
      before { survey.aasm_state = 'pending' }

      it 'changes the status to expired' do
        survey.expire

        expect(survey.aasm_state).to eq('expired')
      end
    end

    context 'when initial state was other than pending' do
      before { survey.aasm_state = 'completed' }

      it 'raise the exception' do
        expect { survey.expire }.to raise_error(AASM::InvalidTransition)
      end
    end
  end
end
