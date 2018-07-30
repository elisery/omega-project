class AddLongitudeToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :longitude, :float
  end
end
