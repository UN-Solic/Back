class Device < ApplicationRecord
	has_many :irradiance_measures
	has_many :wind_measures
	has_many :temp_measures
end
