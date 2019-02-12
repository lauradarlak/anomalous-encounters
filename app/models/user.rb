class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :encounters
  has_many :categories, through: :encounters

  validates :display_name, uniqueness: {case_sensitive: :false}, format: { without: /\s/ }
  validates :email, presence: true, uniqueness: true

  scope :top_categories, -> (cat) { joins(:categories).where('category_id = ?', cat).group(:user_id).order('count(user_id) desc').limit(3) }


  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end

end
