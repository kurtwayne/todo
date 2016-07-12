class Api::UsersController < ApiController
  before_action :authenticated?

  def index
    # need to create a method here to return a UserSerializer-generated json
    # of all the users.
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

end
