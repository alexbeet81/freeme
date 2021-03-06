class Project < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  validates :description, length: { maximum: 250,
    too_long: "%{count} characters is the maximum allowed" }
end
