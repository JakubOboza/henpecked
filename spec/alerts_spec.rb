require 'spec_helper'

class CustomAlert < Henpecked::Alert::AbstractAlert

  def initialize
  end

  def arguments
    ""
  end

end

module Test1
  module Test2
    module Test3
      class TastyCookie < CustomAlert
      end
    end
  end
end


describe Henpecked do

  describe "alerts" do

    it "should have abstract alert class" do
      lambda do
        Henpecked::Alert::AbstractAlert.new
      end.should raise_error
    end
   
    it "should be able to instantiate concrete alert class" do
      lambda do
        CustomAlert.new
      end.should_not raise_error
    end

    it "should have icinga_description" do
      lambda do
        desc = CustomAlert.new.icinga_description
        desc.should_not be_nil
        desc.should be_kind_of(String)
        desc.should =~ /\[\d+\]\s.+;.+/
      end.should_not raise_error
    end

  end

  it "should work ok for nested classes" do
    test = Test1::Test2::Test3::TastyCookie.new
    test.command.should eql("TASTY_COOKIE;") 
  end

end
