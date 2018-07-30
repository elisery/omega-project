class AddLatitudeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :latitude, :float
  end
end
