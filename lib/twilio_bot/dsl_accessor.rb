require "sinatra/base"

class TwilioBot < Sinatra::Base
  module DSLAccessor

    def dsl_accessor(name)
      ivar = "@#{name}"
      metaclass = class << self; self; end
      metaclass.instance_eval do
        define_method name do |new_value = null|
          instance_variable_set ivar, new_value unless new_value == null
          instance_variable_get ivar
        end
      end
    end

    private

    # make a special object to represent no argument
    # so that auth_token can be set to nil
    def null
      @null ||= Object.new
    end
    
  end
end
