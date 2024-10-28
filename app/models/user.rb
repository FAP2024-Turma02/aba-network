class User < ApplicationRecord

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  include DeviseTokenAuth::Concerns::User
  
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validate :email_domain_check
  validate :password_complexity

  enum role: { user: 0, moderator: 1, admin: 2 }

  has_many :post_users, dependent: :destroy
  has_many :posts, through: :post_users
  has_many :comments, dependent: :destroy
  belongs_to :company

  private

  def email_domain_check
    allowed_domains = company.domains.pluck(:domain_url)

    unless allowed_domains.any? { |domain| email.ends_with?("@#{domain}") }
      errors.add(:email, "deve ser de um domínio válido")
    end
  end
  
  def password_complexity
    return if password.blank?
    unless password.match(/\A(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).+\z/)
      errors.add(:password, "deve conter pelo menos uma letra maiúscula, um número e um caractere especial")
    end
  end
end
