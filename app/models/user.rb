class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :cas_authenticatable, :trackable, :timeoutable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username
  # attr_accessible :title, :body
end
