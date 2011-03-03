#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'rspec'
require 'watir-webdriver'


describe "Simple navigation and content checking" do
  before(:all) do
    html_dir = File.expand_path(File.dirname(__FILE__) + '/html')
    simple_html = "FILE://#{html_dir}/simple.html"
    $b = Watir::Browser.new(:firefox)
    $b.goto simple_html
  end

  after(:all) do
    $b.close
  end

  it "verify contents of simple html" do
    $b.text.should == "Simple HTML content"
  end

  it "does not contain any complex HTML" do
    $b.text.should_not match /complex +HTML/i
  end
end
