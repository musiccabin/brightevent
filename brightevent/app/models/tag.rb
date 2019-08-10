class Tag < ApplicationRecord
    has_many :eventtaggings, dependent: :destroy
    has_many :events, through: :eventtaggings
    has_many :usertaggings, dependent: :destroy
    has_many :users, through: :usertaggings

    validates :name, presence: true, uniqueness: {case_sensitive: false}

    before_validation :downcase_name

    private
    def downcase_name
        self.name&.downcase!
    end
end
