require 'rails_helper'

describe 'Performance Data' do
  let(:user) { FactoryGirl.create(:user) }
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }
  let(:credentials) { user.create_new_auth_token }

  describe 'POST /api/v1/data/' do
    it 'creates a data entry' do
      post '/api/v1/data/', { performance_data: { data: { message: 'Average' } } }, headers.merge!(credentials)
      entry = PerformanceData.last
      expect(entry.data).to eq({'message'=>'Average'})
    end
  end
end
