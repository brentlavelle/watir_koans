#!/usr/bin/env ruby
# -*- ruby -*-
require 'rubygems'
require 'rspec'

describe "rspec for simple variables" do
  before(:all) do
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
   @instance = 'new instance value'
   #modifying a copy of the one defined in the before block

   $global.should   == 'new global value'
   @@class.should   == 'new class value'
   @instance.should == 'new instance value'
 end

  it "should verify changed simple variables in this example" do
    $global.should   == 'new global value'
    @@class.should   == 'new class value'
    @instance.should == 'si'
   # Surprise, @instance.should is still 'si' from the begin block
  end
end

describe "instance references can be changed" do
  before(:all) do
    @instance_hash = {:i_live => "heap memory"}
  end

  it "should see the heap variable" do
    @instance_hash.should == {:i_live => "heap memory"}
  end

  it "should modify the heap variable" do
    @instance_hash[:i_live] = "modified hash"
  end

  it "should see the instance new value via the instance var" do
    @instance_hash[:i_live].should == "modified hash"
    # What just happened? The string was not reset between
    # examples. It points back the same memory but the contents
    # of the memory have changed.
  end

  it "should set the class hash to a different hash" do
    @instance_hash = {:i_live => 'new hash'}
    # This hash will be lost forever when @instance_hash
    # goes out of scope when this example finishes.
  end

  it "should still have the modified hash from the before block" do
    @instance_hash[:i_live].should == "modified hash"
    # The previous example changed the reference of hash so it
    # was restored to point to the one from the begin block.
  end
end