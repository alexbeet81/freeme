class Skill < ApplicationRecord
  belongs_to :user

  validates :level, inclusion: { in: %w(beginner intermediate expert) }
end
