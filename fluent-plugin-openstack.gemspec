# frozen_string_literal: true

$LOAD_PATH.push File.expand_path('lib', __dir__)

Gem::Specification.new do |gem|
  gem.name        = 'fluent-plugin-openstack'
  gem.description = 'OpenStack Storage Service (Swift) plugin for Fluentd'
  gem.homepage    = 'https://github.com/jnsolutions/fluent-plugin-openstack'
  gem.summary     = gem.description
  gem.version     = File.read('VERSION').strip
  gem.license     = 'MIT'
  gem.authors     = ['brissenden']
  gem.email       = 'robert.krzysztoforski@protonmail.com'
  gem.platform    = Gem::Platform::RUBY
  gem.files       = `git ls-files`.split("\n")
  gem.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  gem.require_paths = ['lib']

  gem.add_runtime_dependency 'fluentd', ['>= 0.14.2', '< 2']
  gem.add_runtime_dependency 'fog-openstack'
  gem.add_runtime_dependency 'uuidtools'

  gem.add_development_dependency 'bundler', '~> 2.0.2'
  gem.add_development_dependency 'flexmock', '>= 1.2.0'
  gem.add_development_dependency 'rake', '~> 12.0'
  gem.add_development_dependency 'test-unit', '>= 3.1.0'

  gem.add_dependency('xmlrpc') if RUBY_VERSION.to_s >= '2.4'
end
