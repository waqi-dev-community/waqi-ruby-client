# frozen_string_literal: true

require_relative "lib/waqi/version"

Gem::Specification.new do |spec|
  spec.name = "waqi-ruby"
  spec.version = Waqi::VERSION
  spec.authors = ["Kolawole Ezekiel"]
  spec.email = ["doneazy911@gmail.com"]

  spec.summary = "A ruby client to get Real-time Air Quality data feed"
  spec.description = "A ruby client to get Real-time Air Quality data feed"
  spec.homepage = "https://github.com/waqi-dev-community/waqi-ruby-client"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = "https://github.com/waqi-dev-community/waqi-ruby-client/blob/main/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .circleci appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "activesupport", ">= 6.1"
  spec.add_dependency "faraday", "~> 2.0"
  spec.add_development_dependency "rspec", "~> 3.2"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
