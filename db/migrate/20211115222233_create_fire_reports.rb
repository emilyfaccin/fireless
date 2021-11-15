class CreateFireReports < ActiveRecord::Migration[6.1]
  def change
    create_table :fire_reports do |t|
      t.string :street
      t.string :district
      t.string :size

      t.timestamps
    end
  end
end
