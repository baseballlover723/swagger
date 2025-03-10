module Swagger
  # Use parameter in `Swagger::Action`
  struct Parameter
    property name
    property type
    property format
    property parameter_location
    property description
    property default_value
    property required
    property allow_empty_value
    property deprecated
    property ref
    property max_length
    property min_length

    def initialize(@name : String, @parameter_location : String, @type = "string", @description : String? = nil,
                   @default_value : (String | Int32 | Int64 | Float64 | Bool)? = nil, @format : String? = nil,
                   @required = false, @allow_empty_value = false, @deprecated = false, @ref : String? = nil,
                   @max_length : (Int32 | Int64)? = nil, @min_length : (Int32 | Int64)? = nil)
      @min_length = @max_length = nil unless @type == "string"
    end
  end
end
