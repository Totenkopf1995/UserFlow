class User < ApplicationRecord
  has_secure_password # Secure authentication
  validates :name, presence: true # This validation ensures that the name attribute is not empty.
  validates :email, presence: true, uniqueness: true # This validation ensures that the email attribute is not empty and that it is unique

  def self.digest(password)
    BCrypt::Password.create(password) # Generate a strong hash of the password provided.
  end
end