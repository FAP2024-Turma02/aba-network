class User < ApplicationRecord

  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :name, presence: true, length: { minimum: 2, maximum: 50 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validate :email_domain_check
  validates :password, presence: true, length: { minimum: 8 }
  validate :password_complexity

 
  enum role: { user: 0, moderator: 1 }

  private

  def email_domain_check
    allowed_domain = "exemplo.com"
    unless email.ends_with?("@#{allowed_domain}")
      errors.add(:email, "deve ser de um domínio válido (#{allowed_domain})")
    end
  end
  
  def password_complexity
    return if password.blank?
    unless password.match(/\A(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).+\z/)
      errors.add(:password, "deve conter pelo menos uma letra maiúscula, um número e um caractere especial")
    end
  end
end
