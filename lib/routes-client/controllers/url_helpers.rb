module Routes
  module Client
    module Controllers
      # Create url helpers for cross-application linking in different envss.
      # Calls http://cm-routes.herokuapp.com/[environment].json and creates.
      # all the url helpers from it.
      #
      # Those helpers are included by default to ActionController::Base.
      #
      # In case you want to add such helpers to another class, you can do
      # that as long as this new class includes both url_helpers and
      # mounted_helpers. Example:
      #
      #     include Rails.application.routes.url_helpers
      #     include Rails.application.routes.mounted_helpers
      #
      # Run rake routes to see what it picked up (for your current environment)
      #
      module UrlHelpers
        def self.remove_helpers!
          self.instance_methods.map(&:to_s).grep(/_url$/).each do |method|
            remove_method method
          end
        end

        def self.generate_helpers!(routes=nil)
          if routes.empty? do
            require 'open-uri'
            mappings = ActiveSupport::JSON.decode(open(Routes::Client::SERVER + "/#{Rails.env}.json"))
            Routes::Client::URL_HELPERS.deep_copy!(mappings)
            routes = Routes::Client::URL_HELPERS
          end

          routes.each do |app_name, host|
            method = "crowdmob_#{app_name}_url"

            class_eval <<-URL_HELPERS, __FILE__, __LINE__ + 1
              def #{method}(*args)
                Routes::Client::URL_HELPERS[app_name] + "/"
              end
            URL_HELPERS
          end
        end

        generate_helpers!(Routes::Client::URL_HELPERS)
      end
    end
  end
end
