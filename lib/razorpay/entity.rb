require 'json'

module Razorpay
  # Entity class is the base class for all Razorpay objects
  # This saves data in a hash internally, and makes it available
  # via direct methods
  class Entity
    attr_reader :attributes

    def initialize(attributes)
      @attributes = attributes
    end

    # This method fakes attr_reader, but uses
    # the @attributes hash as the source, instead of
    # instance variables
    def method_missing(name)
      if @attributes.key? name.to_s
        @attributes[name.to_s]
      else
        super
      end
    end

    def respond_to_missing?(method_name, include_private = false)
      @attributes.key?(method_name.to_s) || super
    end

    # Public: Convert the Entity object to JSON
    # Returns the JSON representation of the Entity (as a string)
    def to_json
      @attributes.to_json
    end
  end
end
