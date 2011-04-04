#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'rspec'
require 'watir-webdriver'


describe "x" do

  [1,2,3,4,5].each do |n|
    specify "test for #{n}" do
      n.should ==n
    end
  end

end


describe "y " do

  before :all do
    @x = {:x => 1}
  end

  it "a" do
    puts @x
    @x.update :x => 3
    @x = {:x => 4}
  end

  it 'b ' do
    puts @x
    @x[:x].should == 1
  end
end

describe "Simple navigation and content checking" do
  before(:all) do
    html_dir = File.expand_path(File.dirname(__FILE__) + '/html')
    simple_html = "FILE://#{html_dir}/more.html"
    @b = Watir::Browser.new(:firefox)
    @b.goto simple_html
    @f = @b.form(:id => 'newuser')
  end

  after(:all) do
#    @b.close
  end

  it "should have one form on this page" do
    @b.forms.size.should == 1
  end

  it "should find the form by the id" do
    @f.should exist
  end

  it "should have a first name field by id with a name of firstname" do
    puts "f text #{@f.inspect}"
#    @f.flash
    @f.text_field(:id => "fname").name.should == "firstname"
  end

  it "should have a first name field by name" do
    @f.text_field(:name => "firstname").id.should == "fname"
  end

end