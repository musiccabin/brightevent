class User < ApplicationRecord
    has_secure_password

    has_many :events, dependent: :destroy
    has_many :rsvps, dependent: :destroy
    has_many :usertaggings, dependent: :destroy
    has_many :tags, through: :usertaggings

    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: true, 
    format: { with: VALID_EMAIL_REGEX }

    validates :first_name, :last_name, presence: true

    def full_name
     "#{first_name} #{last_name}".strip
     "#{first_name} #{last_name}".strip.titleize
    end

    def tag_names
        self.tags.map(&:name).join(", ")
    end

    def tag_names=(rhs)
        self.tags = rhs.strip.split(/\s*,\s*/).map do |tag_name|
            Tag.find_or_initialize_by(name: tag_name.downcase!)
        end
    end
    
end
