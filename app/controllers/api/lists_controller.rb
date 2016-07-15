class Api::ListsController < ApiController
  include ActiveModel::Validations

  before_action :authenticated?
  validate :permission_status, on: :update
  scope :completed, -> { where(completed: true)}

  def create
    list = List.new(list_params)
    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    begin
      list = List.find(params[:id])
      list.destroy
      render json: {}, status: :no_content
    rescue ActiveRecord::RecordNotFound
      render :json => {}, :status => :not_found
    end
  end

  def update
    list = List.find(params[:id])
    if list.update(list_params)
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:name, :permissions, :completed)
  end

  def completed
    @item.completed = true
    @item.save
  end

  def incomplete
    @item.completed = false
    @item.save
  end

  def permission_status
    if permissions != "private"||"viewable"||"open"
      errors.add(:permissions, "Permission status is required!  Options are private, viewable, and open.")
    end
  end
end
