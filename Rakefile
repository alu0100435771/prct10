$:.unshift File.dirname(__FILE__) + 'lib'

require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new
task :default => :spec

desc "Testeando con Rspec documentado"
task :dspec do
 sh "rspec -I. spec/matrices_spec.rb --format documentation"
end

desc "Testeando con Rspec en html"
task :thtml do
 sh "rspec -I. spec/matrices_spec.rb --format html"
end

desc "Testeando con Pruebas unitarias"
task :test do
 sh "ruby -I. test/tc_matrices.rb"
end
