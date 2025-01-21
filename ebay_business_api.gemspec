# frozen_string_literal: true

require_relative "lib/ebay_business_api/version"

Gem::Specification.new do |spec|
  spec.name = "ebay_business_api"
  spec.version = EbayBusinessApi::VERSION
  spec.authors = ["Jean-Michel Keuleyan"]
  spec.email = ["jm.keuleyan@gmail.com"]

  spec.summary = "A gem to interact with eBay API using LedgerSync operations."
  spec.description = "A gem to interact with eBay API using LedgerSync operations."
  spec.homepage = "https://dropbot.sh"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["homepage_uri"] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'ledger_sync'
  spec.add_dependency 'typhoeus'

  spec.add_development_dependency 'awesome_print'

  spec.add_runtime_dependency 'dotenv'
  spec.add_runtime_dependency 'oauth2', '>= 0'
end
