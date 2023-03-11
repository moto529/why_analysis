class Analysis < ApplicationRecord
  validates :target, presence: true
  belongs_to :user
end
