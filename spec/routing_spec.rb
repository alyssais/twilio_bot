require 'spec_helper'

describe TwilioBot do
  describe "routing" do
    def app
      @app ||= Class.new(TwilioBot)
    end

    it "routes to methods" do
      expect_any_instance_of(app).to receive(:foo)
      post "/foo"
    end
  end
end
