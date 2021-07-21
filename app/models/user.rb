class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_validation :set_slug, only: [:create, :update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy

  # validates :email, uniquness: true
  has_one_attached :photo

  private

  def set_slug
    self.slug = first_name.to_s.parameterize
  end
end
