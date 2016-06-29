class User < ActiveRecord::Base
  has_many :lists

  def full_name
    object.full_name
  end
end
