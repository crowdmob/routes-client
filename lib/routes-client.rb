require "routes-client/version"

module Routes
  module Client
    
    module Controllers
      autoload :UrlHelpers, 'routes-client/controllers/url_helpers'
    end
    
    # Host to lookup routes
    SERVER = 'http://cm-routes.herokuapp.com'
    
    URL_HELPERS = ActiveSupport::OrderedHash.new
    
    # The router Routes::Client should use to generate routes. Defaults
    # to :main_app. Should be overriden by engines in order
    # to provide custom routes.
    mattr_accessor :router_name
    @@router_name = nil
    
    def self.available_router_name
      router_name || :main_app
    end
  end
end
