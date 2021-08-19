require "json"

require "./property"

module Swagger::Objects
  # Schema Object
  #
  # See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.3.md#schemaObject
  class Schema
    include JSON::Serializable

    def self.use_reference(name : String)
      new(ref: "#/components/schemas/#{name}")
    end

    # See https://github.com/OAI/OpenAPI-Specification/blob/master/versions/3.0.3.md#dataTypes
    getter type : String? = nil
    getter format : String? = nil
    getter required : Array(String)? = nil
    getter default : (String | Int32 | Int64 | Float64 | Bool)? = nil
    getter properties : Hash(String, Property)? = nil
    getter items : Schema? = nil

    @[JSON::Field(key: "$ref")]
    getter ref : String? = nil

    @[JSON::Field(key: "maxLength")]
    getter max_length : (Int32 | Int64)? = nil

    @[JSON::Field(key: "minLength")]
    getter min_length : (Int32 | Int64)? = nil

    def initialize(@type : String? = nil, @format : String? = nil, @required : Array(String)? = nil,
                   @default : (String | Int32 | Int64 | Float64 | Bool)? = nil,
                   @properties : Hash(String, Property)? = nil, @ref : String? = nil,
                   @items : self? = nil, @max_length : (Int32 | Int64)? = nil, @min_length : (Int32 | Int64)? = nil)
    end

    def ==(other : self)
      {% for ivar in @type.instance_vars %}
        return false unless @{{ivar.id}} == other.{{ivar.id}}
      {% end %}
      return true
    end
  end
end
