class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :icon

  validates :level, inclusion: { in: %w(beginner intermediate expert) }
end
