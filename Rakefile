require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "machinist-couchrest-model"
    gem.summary = %Q{Machinist support for CouchRest Model}
    gem.description = %Q{Manufacture test CouchRest models with ease using Machinist}
    gem.email = "pezra@barelyenough.org"
    gem.homepage = "http://github.com/pezra/machinist-couchrest-model"
    gem.authors = ["Peter Williams"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_development_dependency "yard", ">= 0"
    gem.add_dependency "machinist", "~> 2.0"
    gem.add_dependency "couchrest_model", "~> 1.1"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.ruby_opts = "-Ilib -Ispec"
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.ruby_opts = "-Ilib -Ispex"
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

begin
  require 'yard'
  YARD::Rake::YardocTask.new
rescue LoadError
  task :yardoc do
    abort "YARD is not available. In order to run yardoc, you must: sudo gem install yard"
  end
end
