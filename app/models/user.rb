# frozen_string_literal: true

class User < ApplicationRecord
  has_many :analyses, dependent: :destroy
end
