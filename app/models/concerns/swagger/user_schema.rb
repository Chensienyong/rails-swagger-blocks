module Swagger::UserSchema
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_schema :User do
      key :required, [:name, :email]
      property :name do
        key :type, :string
      end
      property :email do
        key :type, :string
      end
    end
  end
end
