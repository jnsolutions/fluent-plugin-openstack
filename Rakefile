# frozen_string_literal: true

require 'bundler/gem_tasks'
Bundler::GemHelper.install_tasks

require 'rake/testtask'

Rake::TestTask.new(:test) do |t|
  t.libs.push('lib', 'test')
  t.test_files = FileList['test/**/test_*.rb']
  t.verbose = true
  t.warning = false
end

task default: [:test]
