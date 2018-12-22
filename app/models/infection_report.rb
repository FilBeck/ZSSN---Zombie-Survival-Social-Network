class InfectionReport < ApplicationRecord
	belongs_to :reporter, :class_name => "Survivor"
	belongs_to :survivor_reported, :class_name => "Survivor"
end
