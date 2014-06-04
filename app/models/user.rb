class User < ActiveRecord::Base

	validates :name, presence: true , length: { minimum: 6, maximum: 50 }
	validates :email, presence: true, format: {with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i},
            uniqueness: {:case_sensitive => false}
  validates :password, :length => {minimum: 6}

  validates_confirmation_of :password,
                            if: lambda { |m| m.password.present? }

  before_save {self.admin = 'no'}
  before_save {self.email = email.downcase}
  before_create :create_remember_token

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  has_secure_password




  private

  def create_remember_token
    self.remember_token = User.encrypt(User.new_remember_token)
  end

end
