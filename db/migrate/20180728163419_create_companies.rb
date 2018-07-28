class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :address
      t.text :overview
      t.integer :number_employees
      t.integer :tech_team_size
      t.string :website_url
      t.string :twitter
      t.string :logo_url
      t.string :manager
      t.boolean :published

      t.timestamps
    end
  end
end
