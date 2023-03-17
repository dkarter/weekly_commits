# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'weekly_commits/version'

Gem::Specification.new do |spec|
  spec.name          = 'weekly_commits'
  spec.version       = WeeklyCommits::VERSION
  spec.authors       = ['Dorian Karter']
  spec.email         = ['jobs@doriankarter.com']

  spec.summary       = 'List your commits on a project for every day of a specified week'
  spec.homepage      = 'http://doriankarter.com'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features|screenshots)/}) }
  spec.bindir        = 'bin'
  spec.executables   = ['wcomm']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.1'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  # runtime dependencies
  spec.add_runtime_dependency 'activesupport', '>= 6', '< 8'
  spec.add_runtime_dependency 'colorize', '~> 0.8'
  spec.add_runtime_dependency 'thor', '~> 1.0'
end
