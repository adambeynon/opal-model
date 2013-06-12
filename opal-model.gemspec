# -*- encoding: utf-8 -*-
$LOAD_PATH << File.expand_path('../lib', __FILE__)
require 'opal-model/version'

Gem::Specification.new do |s|
  s.name         = 'opal-model'
  s.version      = OpalModel::VERSION
  s.author       = 'Adam Beynon'
  s.email        = 'adam.beynon@gmail.com'
  s.homepage     = 'http://opalrb.org'
  s.summary      = '.'
  s.description  = '..'

  s.files          = `git ls-files`.split("\n")
  s.executables    = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.test_files     = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths  = ['lib']

  s.add_dependency 'opal'
  s.add_dependency 'opal-jquery'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'opal-spec', '>= 0.2.15'
end
