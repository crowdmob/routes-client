require "routes-client/controllers/url_helpers"

module Routes
  module Client
    class Railtie < Rails::Railtie
      initializer "routes-client.url_helpers" do
        ActiveSupport.on_load(:action_controller) do
          include Routes::Client::Controllers::UrlHelpers
        end

        ActiveSupport.on_load(:action_view) do
          include Routes::Client::Controllers::UrlHelpers
        end
      end
    end
  end
end