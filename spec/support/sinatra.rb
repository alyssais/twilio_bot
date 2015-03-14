module SinatraSupport
  def app
    @app ||= Class.new(TwilioBot) do
      configure do
        set :raise_errors, true
        set :show_exceptions, false
      end

      def test
      end
    end
  end
end
