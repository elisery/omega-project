class NewsSource < ApplicationRecord
  validates(:source, presence: true, uniqueness: true)
end
