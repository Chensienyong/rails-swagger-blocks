class UsersController < ApplicationController
  include Swagger::Blocks
  before_action :set_user, only: [:show, :update, :destroy]

  swagger_path '/users/{id}' do
    # GET / users /: of id endpoint definition
    operation  :get  do
      key :description ,  'Find A User By ID'
      key :operationId ,  :find_user_by_id

      # Path parameters id definition
      parameter  Name: :id  do
        key  :in ,  :path
        key  :description ,  'User ID'
        key  :required ,  true
        key  :type ,  :integer
        key  :format ,  :int64
      end

      # Definition of success response
      response  200  do
        key  :description ,  'User'
        schema  do
          key  :required ,  [ :id ,  :name ]
          property  :id  do
            key  :type ,  :integer
            key  :format ,  :int64
          end
          property  :Name  do
            key  :Type ,  :String
          end
        end
      end
    end
  end

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
