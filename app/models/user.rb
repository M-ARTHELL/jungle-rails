class User < ActiveRecord::Base

  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :password_confirmation, presence: true

  before_save :downcase_email

  def downcase_email
    self.email.downcase!
  end

  def authenticate_with_credentials(email, password)
    user = User.find_by(email: email)

    if user && user.authenticate(password)
      return user
    else
      return nil
    end
  end
  
end