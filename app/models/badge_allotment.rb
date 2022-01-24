class BadgeAllotment < ApplicationRecord
  belongs_to :user
  nelongs_to :badge
end
