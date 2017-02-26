require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

task :default => :test

desc 'Boots irb with hattruby preloaded'
task :console do
  require 'dotenv'
  Dotenv.load
  exec "irb -r hattruby -I ./lib"
end
