class PerformanceData < ActiveRecord::Base
  belongs_to :user
  has_many :performance_data, class_name: 'PerformanceData'
end
