module Routes
  module Client
    class Railtie < Rails::Railtie
      initializer "routes-client.url_helpers" do
        Routes::Client.include_url_helpers(Routes::Client::Controllers)
      end
    end
  end
end