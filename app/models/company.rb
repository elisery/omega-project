class Company < ApplicationRecord
  has_many :taggings, dependent: :destroy 
  has_many :tags, through: :taggings
  
  has_many :users
  
  geocoded_by :address
  after_validation :geocode

  validates(:name, presence: true, uniqueness: true)
  validates(:website_url, uniqueness: true)

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

  filterrific(
    default_filter_params: { sorted_by: 'created_at_asc' },
    available_filters: [
      :sorted_by,
      :search_query,
      :with_tag,
      :with_team_size
    ]
  )

  self.per_page = 3

  scope :with_tag, lambda { |tag_id|
    tag = Tag.where('id = ?', tag_id).first
    tag.companies.order(created_at: :asc)
  }

  scope :with_team_size, lambda { |team_range|
    ranges = team_range.split("-")
    min = ranges[0]
    max = ranges [1]
    where(tech_team_size: min..max)
  }

  scope :search_query, lambda { |query|
    tag = Tag.where('lower(name) = ?', query.downcase).first
    name_add = where('lower(name) || lower(address) LIKE ?', "%#{query.downcase}%")
    if tag
      return tag.companies.order(created_at: :asc)
    end
    if(name_add)
      return name_add
    else
      return nil
    end
  }

  scope :sorted_by, lambda { |sort_option|
    direction = (sort_option =~ /desc$/) ? 'desc' : 'asc'
    case sort_option.to_s
    when /^created_at_/
      order("companies.created_at #{ direction }")
    else
      raise(ArgumentError, "Invalid sort option: #{ sort_option.inspect }")
    end
  }

  def self.options_for_sorted_by
    [
      ['Registration date (newest first)', 'created_at_desc'],
      ['Registration date (oldest first)', 'created_at_asc'],
    ]
  end

  def self.team_size_to_select
    biggest_company = order("companies.tech_team_size #{ 'desc' }").first
    max_team_size = biggest_company.tech_team_size
    puts max_team_size
    team_size = [0, 101, 501, 1001, 5001, 10001, 50001, 100001, 500001]
    team_size_abs = team_size.select { |s| s <= max_team_size }
    team_size_abs.push(team_size[team_size_abs.length])
    team_size_arr = []
    team_size_abs.each_index { |index|
        if index < (team_size_abs.length-1)
            team_size_arr.push("#{team_size_abs[index]}-#{team_size_abs[index+1]-1}")
        end
    }
    puts team_size_arr
    return team_size_arr         
  end
end