class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :groups 
  has_many :group_members
  has_many :posts, dependent: :destroy
  has_many :comments , dependent: :destroy
end
