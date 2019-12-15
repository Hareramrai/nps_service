require 'rails_helper'
RSpec.describe Realtor, type: :model do

  it_behaves_like 'surveyable'
  it_behaves_like 'undeleted record not visible'

  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:date_of_birth) }
    it { should validate_presence_of(:phone) }
    it { should validate_uniqueness_of(:email).case_insensitive }
  end
end
