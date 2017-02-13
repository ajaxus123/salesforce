class User < ApplicationRecord
  

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :stores
  has_many :visits
  
  def remember_me
  	(super == nil) ? '1' : super
  end

  def full_name
    [first_name, last_name].join(' ')
  end

end
