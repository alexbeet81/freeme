class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_validation :set_slug, only: [:create, :update]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # acts_as_token_authenticatable

  validates :first_name, :last_name, presence: true

  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :experiences, dependent: :destroy

  # validates :email, uniquness: true
  has_one_attached :photo

  def to_param
    "#{id}-#{slug}"
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  private

  def set_slug
    self.slug = "#{first_name}_#{last_name}".parameterize
  end
end
