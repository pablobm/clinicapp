class Prescription < ApplicationRecord
	belongs_to :appointment
	
	validates :prescript, presence: true, length: { in: 1..1000 }
end
