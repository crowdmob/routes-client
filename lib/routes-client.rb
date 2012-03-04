require "routes-client/version"

module Routes
  module Client
    SERVER = 'http://cm-routes.herokuapp.com' # Host to lookup routes
    URL_HELPERS = nil
  end
end

require 'routes-client/railtie'
