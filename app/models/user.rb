# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  name               :string(255)      not null
#  email              :string(255)
#  encrypted_password :string(255)      not null
#  salt               :string(255)
#  birthday           :date
#  administrator      :boolean          default(FALSE)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :login_name, :email, :hashed_password

  validates :login_name, :presence => true

  validates :hashed_password, :presence     => true,
                              :confirmation => true,
                              :length       => { :within => 6..40 }
  before_save :hashed_password

  def has_password?(submitted_password)
    hashed_password == encrypt(submitted_password)
  end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

=begin
  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end
=end

  private

  def hashed_password
    self.hashed_password = encrypt(password)
  end

  def encrypt(string)
    string
  end

  def make_salt
    secure_hash("#{Time.now.utc}--#{password}")
  end

  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end

end
