#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'rspec'
require 'watir-webdriver'


describe "Simple navigation and content checking" do
  before(:all) do
    html_dir = File.expand_path(File.dirname(__FILE__) + '/html')
    simple_html = "FILE://#{html_dir}/simple.html"
    @browser = Watir::Browser.new :firefox
    @browser.goto simple_html
  end

  after(:all) do
    @browser.close
  end

  it "verify contents of contains" do
    @browser.text.should match /simple html/i
  end

  it "does not contain any complex HTML" do
    @browser.text.should_not match /complex +HTML/i
  end

  it "should have a link to more HTML" do
    $link=@browser.link :text, 'more HTML'
    $link.should_not be_nil
  end

  it "you can click the link and go to more HTML" do
    $link.click
    @browser.text.should match /more HTML content/i
  end

end
