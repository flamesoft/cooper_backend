require 'rails_helper'

RSpec.describe PerformanceData, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :data }
  end

  describe 'Relations' do
    it { is_expected.to belong_to :user }
  end
end
