class User < ActiveRecord::Base
  has_many :lists

#need to update migrations to include username, password, email, ect...
  def full_name
    object.full_name
  end
end
