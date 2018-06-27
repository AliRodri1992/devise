class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :authentication_keys => [:username]

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  validates :email, uniqueness: true
  validates :username, uniqueness: true, presence: true

  # Only allow letter, number, underscore and punctuation.
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true

  # descomentar esto si solo se quiere dar de alta el puro username y su password
=begin
  def email_required?
    false
  end

  def email_changed?
    false
  end
=end
  def role?( role )
    !roles.find_by_name( role.to_s.camelize ).nil?
  end
end
