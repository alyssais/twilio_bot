# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'twilio_bot/version'

Gem::Specification.new do |spec|
  spec.name          = "twilio_bot"
  spec.version       = TwilioBot::VERSION
  spec.authors       = ["Ross Penman"]
  spec.email         = ["ross@pen.mn"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com' to prevent pushes to rubygems.org, or delete to allow pushes to any server."
  end

  spec.summary       = %q{Map Twilio webhooks to a plain Ruby class}
  spec.homepage      = "https://github.com/penman/twilio_bot"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rack", "~> 1.5.2"
  spec.add_dependency "sinatra", "~> 1.4"
  spec.add_dependency "builder", "~> 3.2"
  spec.add_dependency "activesupport", "~> 4.2"

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rspec-mocks", "~> 3.0"
  spec.add_development_dependency "rack-test", "~> 0.6.3"
  spec.add_development_dependency "nokogiri", "~> 1.6"
end
