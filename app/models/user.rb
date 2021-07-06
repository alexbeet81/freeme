class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :skills, dependent: :destroy
  has_many :projects, dependent: :destroy
  has_many :experience, dependent: :destroy

  # validates :email, uniquness: true
end
