class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role
  # attr_accessible :title, :body
  def admin?
    self.role == "1"
  end
  def vendor?
    self.role == "2"
  end
  def tutor?
    self.role == "3"
  end
  def learner?
    self.role == "4"
  end
end
