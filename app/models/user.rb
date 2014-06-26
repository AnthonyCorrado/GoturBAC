require 'bcrypt'
#NOTE: May need to add in Amazon aws stuff once you host on Heroku!!!
class User < ActiveRecord::Base

belongs_to :venue
has_many :friendships
has_many :user_drinks
has_many :drinks, through: :user_drinks

accepts_nested_attributes_for :user_drinks

has_attached_file :avatar, :styles => {:medium => "300x300>", :small => "150x150#", :thumb => "45x45#" }


validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

validates_presence_of :name, :password, :weight
validates_uniqueness_of :name
validates_numericality_of :weight, less_than: 1000


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

  def avatar_url(size)
    self.avatar.url(size).gsub('s3.amazonaws.com/', 's3-us-west-1.amazonaws.com/')
  end

end
