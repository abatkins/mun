require 'role_model'

class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # For more info on RoleModel, go to:  https://github.com/martinrehfeld/role_model
  include RoleModel

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :roles, :roles_mask

  # optionally set the integer attribute to store the roles in,
  # :roles_mask is the default
  roles_attribute :roles_mask

  # declare the valid roles -- do not change the order if you add more
  # roles later, always append them at the end!
  roles :admin, :registered, :staff

  before_save :default_role

  # Default role is "Registered"
  def default_role
    if self.roles.empty?
      self.roles = [:registered]
    end

  end

end

