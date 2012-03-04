# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "routes-client/version"

Gem::Specification.new do |s|
  s.name        = "routes-client"
  s.version     = Routes::Client::VERSION
  s.authors     = ["Matthew Moore"]
  s.email       = ["matt@crowdmob.com"]
  s.homepage    = ""
  s.summary     = %q{Adds crowdmob service url helpers to your CrowdMob application.}
  s.description = %q{Adds crowdmob service url helpers to your CrowdMob application.  It does this by querying http://cm-routes.herokuapp.com on startup and loading in the routes it finds.}

  s.rubyforge_project = "routes-client"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
