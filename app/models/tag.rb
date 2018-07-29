class Tag < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    before_validation :downcase_name
  
    has_many :taggings, dependent: :destroy
    has_many :companies, through: :taggings

    def humanized_name
        name&.humanize
    end

    def self.options_for_select
        order('LOWER(name)').map { |e| [e.humanized_name, e.id] }
    end

    private
    def downcase_name
      self.name&.downcase!
    end
end
