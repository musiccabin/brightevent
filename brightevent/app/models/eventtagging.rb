class Eventtagging < ApplicationRecord
  belongs_to :event
  belongs_to :tag

  validates :tag, uniqueness: {scope: :event}
end
