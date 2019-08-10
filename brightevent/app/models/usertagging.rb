class Usertagging < ApplicationRecord
  belongs_to :user
  belongs_to :tag

  validates :tag, uniqueness: {scope: :user}
end
