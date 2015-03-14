require "spec_helper"

describe TwimlBuilder do
  it "camelizes attribute keys" do
    builder = TwimlBuilder.new
    text = builder.foo one_two: "baz"
    expect(text).to include "oneTwo"
  end

  it "uppercases node names" do
    builder = TwimlBuilder.new
    text = builder.foo
    expect(text).to eq "<Foo/>"
  end
end
