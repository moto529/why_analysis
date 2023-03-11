class User < ApplicationRecord
  has_many :analyses, dependent: :destroy
end
