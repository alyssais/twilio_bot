require "active_support/inflector"

class TwimlBuilder < Builder::XmlMarkup
  def tag!(name, *args, &block)
    name = name.capitalize
    args = args.map do |arg|
      if arg.is_a?({}.class)
        arg.map { |k, v| [k.to_s.camelize(:lower), v] }.to_h
      else
        arg
      end
    end
    super
  end
end
