class Event < ApplicationRecord
  belongs_to :user

  has_many :rsvps, dependent: :destroy
  has_many :eventtaggings, dependent: :destroy
  has_many :tags, through: :eventtaggings
  before_save :set_default_image

  validates(:title, presence: {message: "must exist"}, uniqueness: true, length: {minimum: 10})

    def tag_names
        self.tags.map(&:name).join(", ")
    end

    def tag_names=(rhs)
        self.tags = rhs.strip.split(/\s*,\s*/).map do |tag_name|
            Tag.find_or_initialize_by(name: tag_name)
        end
    end

    def set_default_image
        if self.img_url.nil?
            self.img_url = "https://i.imgur.com/bH3Guk2.jpg"
        end
    end

    private
end
