require "routes-client/version"

module Routes
  module Client
    SERVER = 'http://routes.crowdmob.com' # Host to lookup routes
    URL_HELPERS = {}
  end
end

require 'routes-client/railtie'
