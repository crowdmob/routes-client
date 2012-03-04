require "routes-client/version"

module Routes
  module Client
    
    module Controllers
      autoload :UrlHelpers, 'routes-client/controllers/url_helpers'
    end
    
    # Host to lookup routes
    SERVER = 'http://cm-routes.herokuapp.com'
    URL_HELPERS = ActiveSupport::OrderedHash.new
    
    # Include helpers in the given scope to ActionController and ActionView.
    def self.include_url_helpers(scope)
      ActiveSupport.on_load(:action_controller) do
        include scope::UrlHelpers
      end

      ActiveSupport.on_load(:action_view) do
        include scope::UrlHelpers
      end
    end
  end
end
