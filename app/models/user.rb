class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
    :omniauthable, omniauth_providers: [:google_oauth2]
    
  validates :email, presence: true, uniqueness: true
  
  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first
    return user
  end
  
  def tutor?
    return self.tutor 
  end 
  
  def admin?
    return self.admin
  end 
end

