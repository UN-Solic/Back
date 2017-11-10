class CreateHumidityMeasures < ActiveRecord::Migration[5.1]
  def change
    create_table :humidity_measures do |t|
      t.datetime :time
      t.float :measure
      t.belongs_to :device, foreign_key: true

      t.timestamps
    end
  end
end
