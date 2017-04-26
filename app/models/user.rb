class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :todo_lists
  validates_presence_of :password, :on => :create

  def send_password_reset
  	generate_token(:password_reset_token)
  	self.password_reset_sent_at = Time.now
  	save!
  	UserMailer.password_reset(self).deliver
  end
end
