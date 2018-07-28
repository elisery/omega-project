class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.string :date
      t.string :event_url
      t.string :time
      t.references :meetup_group, foreign_key: true

      t.timestamps
    end
  end
end
