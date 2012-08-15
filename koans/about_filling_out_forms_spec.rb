#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'rspec'
require 'watir-webdriver'

describe "Working with forms" do
  before(:all) do
    html_dir = File.expand_path(File.dirname(__FILE__) + '/html')
    simple_html = "FILE://#{html_dir}/more.html"
    @browser = Watir::Browser.new(:firefox)
    @browser.goto simple_html
    @form = @browser.form(:id => 'newuser')
  end

  after(:all) do
    @browser.close
  end

  #Fixme forms should come later
  it "should have one form on this page" do
    @browser.forms.size.should == 1
  end

  it "should find the form by the id" do
    @form.should exist
  end

  it "should have a first name field by id with a name of firstname" do
    @form.text_field(:id => "fname").name.should == "firstname"
  end

  it "should have a first name field by name" do
    @form.text_field(:name => "firstname").id.should == "fname"
  end

  it "should flash 10 times and return the number of flashes" do
    # Flashing in the browser can help you identify page elements sometimes \
    # the flashing is not where we expect to see it.
    @form.text_field(:id => "fname").flash.should == 10
  end

  it "has an HTML method for the view source crowd" do
    # Looking at the HTML, especially in irb, can help demystify a test, however it created from the DOM and
    # will probably be different that the document served
    html_text = @form.text_field(:id => "fname").html
    html_text.should match(/^\<input /)
    html_text.should match(/\btype="text"/)
    html_text.should match(/\bname="firstname"/)
    html_text.should match(/\bid="fname"/)
  end
end