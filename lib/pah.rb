require 'rails'
require 'colored'
require 'bundler'

module Pah
  require 'pah/version'
  require 'pah/configuration'
  require 'pah/runner'
  require 'pah/template'

  TEMPLATE_ROOT = File.expand_path(File.join('pah'), File.dirname(__FILE__))
end
