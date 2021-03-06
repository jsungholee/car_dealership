class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :role, :remember_me

  has_many :cars, :inverse_of => :user, dependent: :destroy
  has_many :offers

  def self.arrayify
    user_array = []
    User.order('created_at ASC').all.each do |user|
      user_array << user.email
    end
    return user_array
  end
end
