class CreateMeetupGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :meetup_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
