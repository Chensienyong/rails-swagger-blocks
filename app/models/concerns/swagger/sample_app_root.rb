# Parameters は swagger_root 内で extend しておく
module Swagger::SampleAppRoot
  extend ActiveSupport::Concern
  include Swagger::Blocks

  included do
    swagger_root do
      # ...

      extend Swagger::Parameters
    end
  end
end
