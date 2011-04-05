#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'rspec'
require 'watir-webdriver'

describe "rspec for simple variables" do
  before(:all) do
    puts "before :all"
    $global   = 'sg'
    @@class   = 'sc'
    @instance = 'si'
  end

  it "should see all simple before variables" do
    $global.should   == 'sg'
    @@class.should   == 'sc'
    @instance.should == 'si'
  end

  it "should change all the simple before variables" do
    $global   = 'new global value'
    @@class   = 'new class value'
    @instance = 'new instance value' #modifying a copy

    $global.should   == 'new global value'
    @@class.should   == 'new class value'
    @instance.should == 'new instance value'
  end

  it "should verify changed simple variables in another example" do
    $global.should   == 'new global value'
    @@class.should   == 'new class value'
    @instance.should == 'si'
  end
end

describe "references can be changed" do
  before(:all) do
    @class_hash = {:i_live => "heap memory"}
  end

  it "should see the heap variable" do
    @class_hash.should == {:i_live => "heap memory"}
  end

  it "should modify the heap variable" do
    @class_hash[:i_live] = "modified existing hash"
  end

  it "should see the instance new value through the class var" do
    @class_hash[:i_live].should == "modified existing hash"
    #What just happened? The string was reset between examples.  Hold on.
  end

  it "should set the class hash to a different hash" do
    @clash_hash = {:i_live => 'new memory'}
  end

  it "should still have the modified hash from the before block" do
    @class_hash[:i_live].should == "modified existing hash"
  end
end
