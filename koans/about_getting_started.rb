#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'watir-webdriver'

html_dir = File.expand_path(File.dirname(__FILE__) + '/html')
simple_html = "FILE://#{html_dir}/simple.html"
puts "Simple is '#{simple_html}'"

b = Watir::Browser.new(:firefox)
b.goto simple_html
puts "Text on simple page is should be 'Simple HTML content' is: '#{b.text}'"

