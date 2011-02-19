#!/usr/bin/env ruby
# -*- ruby -*-

require "watir"
b = Watir::Browser.new
b.goto File.expand_path(File.dirname(__FILE__) + '/html/simple.html')
