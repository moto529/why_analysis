# frozen_string_literal: true

class AddUserRefToAnalyses < ActiveRecord::Migration[6.1]
  def change
    add_reference :analyses, :user, foreign_key: true
  end
end
