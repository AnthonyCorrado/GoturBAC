require 'bcrypt'
#NOTE: May need to add in Amazon aws stuff once you host on Heroku!!!
class User < ActiveRecord::Base

belongs_to :venue
has_many :friendships

has_attached_file :avatar, :styles => {:medium => "300x300>", :small => "150x150#", :thumb => "45x45#" }


validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

validates_presence_of :username, :email, :password
validates_uniqueness_of :username, :email
validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create


  def password
    @password
  end

  def password=(new_password)
    @password = new_password
    self.password_digest = BCrypt::Password.create(new_password)
  end

  def authenticate(test_password)
    if BCrypt::Password.new(self.password_digest) == test_password
        self
    else
        false
    end
  end

end
