# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "mail_inline_css/version"

Gem::Specification.new do |s|
  s.name        = "mailer_inline_css"
  s.version     = MailInlineCss::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Daniel Jagszent"]
  s.email       = ["daniel@jagszent.de"]
  s.homepage    = ""
  s.summary     = %q{Inlines CSS declarations as style attributes for HTML mails.}
  s.description = %q{Automatically inlines CSS classes as style attributes for every HTML mail you send with the mail gem. Including every mail that is send with Rails' >= 3 ActionMailer classes}

  s.rubyforge_project = "mail_inline_css"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'mail'
  s.add_dependency 'nokogiri'
  s.add_dependency 'css_parser_master'
  s.add_development_dependency 'rake', '~> 0.8.7'
  s.add_development_dependency 'rspec', '~> 2.6.0'
  s.add_development_dependency 'guard'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rb-fsevent' if RUBY_PLATFORM =~ /darwin/
  s.add_development_dependency 'growl' if RUBY_PLATFORM =~ /darwin/
end
