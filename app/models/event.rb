class Event < ApplicationRecord
  belongs_to :meetup_group

  # this validation may change in the future 
  validates(:title, presence: true, uniqueness: true)
  validates :date, presence: true
  validates :event_url, presence: true
  validates :time, presence: true


end
