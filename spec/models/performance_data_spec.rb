require 'rails_helper'

RSpec.describe PerformanceData, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:headers) { {HTTP_ACCEPT: 'application/json'} }
  let(:credentials) { user.create_new_auth_token }

  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :data }
  end

  describe 'Relations' do
    it { is_expected.to belong_to :user }
  end

  describe 'Performance Data' do
    let(:headers){ {HTTP_ACCEPT: 'application/json'}}

    describe 'POST /api/v1/data/' do
        it 'creates a data entry' do
          post '/api/v1/data/', {performance_data: {data: {message: 'Average'}}}, headers.merge!(credentials)
          entry = PerformanceData.last
          expect(entry.data).to eq({'message'=>'Average'})
        end
    end
  end
end
