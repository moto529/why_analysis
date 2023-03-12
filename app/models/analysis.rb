# frozen_string_literal: true

class Analysis < ApplicationRecord
  validates :target, presence: true
  belongs_to :user
  has_many :is_whies
end
