require "rubygems"
require "bundler/setup"
Bundler.setup(:default)

$LOAD_PATH.unshift File.expand_path(File.dirname(__FILE__) + '/lib')
require 'rulu'

use Rack::ShowExceptions
run Rulu.new