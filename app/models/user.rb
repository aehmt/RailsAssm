class User < ApplicationRecord
  has_many :boards
  has_many :collaborations
  has_many :cards, through: :collaborations
  has_many :feeds
  has_many :shared_boards, foreign_key: 'collaborator_id'
  has_many :collaborating_boards, through: :shared_boards, source: :board


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,:validatable,
         :omniauthable, :omniauth_providers => [:facebook]
         # authorization
  enum role: [:user, :admin]

  after_initialize :set_default_role, :if => :new_record?

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end      
  end

  def all_checked
    self.cards.where(checked: true)
  end

  def avatar
    self.email[0].upcase
  end

  private
    def set_default_role
      self.role ||= :user
    end
end
