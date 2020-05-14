module Swagger::Parameters
  def self.extended(base)
    base.parameter :user_id do
      key :in, :path
      key :description, 'User ID'
      key :required, true
      key :type, :integer
      key :format, :int64
    end
  end
end
