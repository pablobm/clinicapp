class Appointment < ApplicationRecord
	belongs_to :doctor
	belongs_to :user
	has_one :prescription, dependent: :destroy
	attribute :appointment_date, :datetime
end
