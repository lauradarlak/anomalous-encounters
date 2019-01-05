class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable

  has_many :encounters
  has_many :categories, through: :encounters

  validates :display_name, presence: true, uniqueness: {case_sensitive: :false}

end
