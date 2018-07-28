class CreateNewsSources < ActiveRecord::Migration[5.2]
  def change
    create_table :news_sources do |t|
      t.string :source

      t.timestamps
    end
  end
end
