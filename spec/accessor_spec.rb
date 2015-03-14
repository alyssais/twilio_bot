require 'spec_helper'

describe TwilioBot do

  %w(account_sid auth_token).each do |prop|
    describe ".#{prop}" do
      it "gets and sets" do
        TwilioBot.public_send prop, "foo"
        expect(TwilioBot.public_send(prop)).to eq "foo"
      end

      it "can be set to nil" do
        TwilioBot.public_send prop, "foo"
        TwilioBot.public_send prop, nil
        expect(TwilioBot.public_send prop).to eq nil
      end

      describe "with 2+ arguments" do
        it "raises ArgumentError" do
          expect do
            TwilioBot.public_send(prop, "1", "2")
          end.to raise_error ArgumentError
        end
      end
    end
  end

end
