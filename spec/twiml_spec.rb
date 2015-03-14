require "nokogiri"
require "spec_helper"

describe TwilioBot do
  it "provides a TwiML builder" do
    twilio = 0
    app.send :define_method, :foo do
      twilio = self.twilio
    end
    post "/foo"
    ancestors = class << twilio; ancestors; end
    expect(ancestors).to include TwimlBuilder
  end

  describe "response" do
    it "Allows XML to be customised" do
      app.send :define_method, :respond do
        twilio.parent attribute: "value" do |parent|
          twilio.child "content"
        end
      end
      post "/respond"
      xml = Nokogiri::XML(last_response.body)
      expect(xml.to_s).to eq <<-XML
<?xml version="1.0" encoding="UTF-8"?>
<Response>
  <Parent attribute="value">
    <Child>content</Child>
  </Parent>
</Response>
XML
    end

    it "responds with XML Content-Type" do
      post "/test"
      type = last_response["Content-Type"]
      expect(type).to start_with "application/xml"
    end

    it "responds with TwiML body" do
      post "/test"
      xml = Nokogiri::XML(last_response.body)
      expect(last_response.body).to start_with "<?xml"
      expect(xml.css(":root").map(&:name)).to eq ["Response"]
    end
  end
end
