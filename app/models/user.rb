class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :username

  validates :username, :email, :presence => true, :uniqueness => true
  validates :email, :format => { :with => /@/ }

  def self.authenticate(username, password)
      find_by_username(username).try(:authenticate, password)
  end
end
