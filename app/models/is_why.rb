# frozen_string_literal: true

class IsWhy < ApplicationRecord
  validates :result, presence: true
  belongs_to :analysis
end
