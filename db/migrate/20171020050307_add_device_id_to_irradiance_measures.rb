class AddDeviceIdToIrradianceMeasures < ActiveRecord::Migration[5.1]
  def change
  	add_column :irradiance_measures, :device_id, :integer
    add_index  :irradiance_measures, :device_id
  end
end
