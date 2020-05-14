Swagger
  module :: UsersApi extend  ActiveSupport :: Concern
  include  Swagger :: Blocks

  included do
    include Swagger::ErrorSchema

    swagger_path  '/ users / {id}'  do
      parameters  : user_id  # Include parameters defined in root

      operation :get do
        key :description, 'Returns the specified user'
        key :operationId, :find_user_by_id

        Response  200  Do
          Key  : Description ,  'User Specified By Its ID'
          Schema  Do
            Key  : '$ Ref' ,  : User  # refer to the User which is separately defined
          End
        End

        #
        Include separately defined error responses extend  Swagger :: ErrorResponses :: NotFoundError
      end
    end
  end
end
