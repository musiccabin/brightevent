class Usertagging < ApplicationRecord
  belongs_to :user
  belongs_to :tag
end
