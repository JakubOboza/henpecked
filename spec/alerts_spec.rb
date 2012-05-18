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

  describe "alert classes" do

    before(:each) do
      Delorean.back_to_the_present
    end

    it "should have AcknowledgeHostProblem class" do
      Henpecked::Alert::AcknowledgeHostProblem.new.icinga_description.should_not be_nil
      Henpecked::Alert::AcknowledgeHostProblemExpire.new.icinga_description.should_not be_nil
      Henpecked::Alert::SendCustomHostNotification.new.icinga_description.should_not be_nil
    end

    it "should create correct custom host notification" do
      Delorean.time_travel_to "01/01/1985" 
      scn = Henpecked::Alert::SendCustomHostNotification.new(1,1,1,"Test Lol!")
      scn.icinga_description.should eql("[473428800] SEND_CUSTOM_HOST_NOTIFICATION; 1;1;1;Test Lol!") 
    end

  end

end
