require 'bundler'
Bundler::GemHelper.install_tasks

require 'rake/rdoctask'
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new(:spec) do |t|
  t.ruby_opts = "-w"
  t.pattern = "spec/**/*_spec.rb"
  t.rspec_opts = %w(--backtrace --color)
end

Rake::RDocTask.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'MailInlineCSS'

  rdoc.options << '-c' << 'utf-8'
  rdoc.options << '--line-numbers'
  rdoc.options << '--inline-source'
  rdoc.options << '-m' << 'README.rdoc'

  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('LICENSE')
  rdoc.rdoc_files.include('lib/**/*.rb')

end
