class Company < ApplicationRecord
  
  has_many :taggings, dependent: :destroy 
  has_many :tags, through: :taggings
  has_many :users

  validates :name, presence: true, uniqueness: true
  validates :website_url, uniqueness: true

  validates(:number_employees, 
    numericality: {
      greater_than: 0
    }
  )

  validates(:tech_team_size, 
    numericality: {
      greater_than: 0
    }
  )

  validates :published, default: false 

end
