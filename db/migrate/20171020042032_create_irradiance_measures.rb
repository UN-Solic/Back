class CreateIrradianceMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :irradiance_measures do |t|
      t.datetime :time
      t.float :measure

      t.timestamps
    end
  end
end
