lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "currenciesdirect/version"

Gem::Specification.new do |spec|
  spec.name          = "currenciesdirect-currenciesdirect"
  spec.version       = Currenciesdirect::Currenciesdirect::VERSION
  spec.authors       = ["Jason Crockett"]
  spec.email         = ["JesusisLord33333@outlook.com"]

  spec.summary       = "An api wrapper for currenciesdirect - the travel money company"
  spec.homepage      = "https://github.com/adisciple50/currenciesdirect-currenciesdirect"
  spec.license       = "MIT"


  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/adisciple50/currenciesdirect-currenciesdirect"
  # spec.metadata["changelog_uri"] = "https://github.com/adisciple50/ruby-currenciesdirect"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
