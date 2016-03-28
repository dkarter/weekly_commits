# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weekly_commits/version'

Gem::Specification.new do |spec|
  spec.name          = 'weekly_commits'
  spec.version       = WeeklyCommits::VERSION
  spec.authors       = ['Dorian Karter']
  spec.email         = ['jobs@doriankarter.com']

  spec.summary       = %q{List your commits on a project for every day of a specified week}
  spec.homepage      = 'http://doriankarter.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['wcomm']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', "~> 1.11"
  spec.add_development_dependency 'rake', "~> 10.0"
  spec.add_development_dependency 'rspec', "~> 3.0"

  # runtime dependencies
  spec.add_runtime_dependency 'activesupport'
  spec.add_runtime_dependency 'thor'
  spec.add_runtime_dependency 'colorize'
end
