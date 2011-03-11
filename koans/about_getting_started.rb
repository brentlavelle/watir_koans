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

  it "verify contents of contains" do
    $b.text.should match /simple html/i
  end

  it "does not contain any complex HTML" do
    $b.text.should_not match /complex +HTML/i
  end

  it "should have a link to more HTML" do
    $link=$b.link :text, 'more HTML'
    $link.should_not be_nil
  end

  it "you can click the link and go to more HTML" do
    $link.click
    $b.text.should match /more HTML content/i
  end

end
