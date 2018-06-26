class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true
  # descomentar esto si solo se quiere dar de alta el puro username y su password
=begin
  def email_required?
    false
  end

  def email_changed?
    false
  end
=end
end
