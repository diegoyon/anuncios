class SeenAnnouncement < ApplicationRecord
  belongs_to :user
  belongs_to :announcement

  attribute :seen, :boolean, default: false
end
