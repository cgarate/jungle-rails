class User < ActiveRecord::Base
  has_secure_password

  has_many :reviews
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  

  def self.authenticate_with_credentials(email, password)
    emaillc = email.downcase
    user = User.find_by_email(emaillc)
    if user && user.authenticate(password)
      user
    else
      return nil
    end
  end

end
