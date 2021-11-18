class AddReporterAndPhoneToFireReport < ActiveRecord::Migration[6.1]
  def change
    add_column :fire_reports, :reporter, :string
    add_column :fire_reports, :phone, :string
  end
end
