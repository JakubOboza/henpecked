require 'spec_helper'

describe Henpecked do

  describe "#push" do

    before(:each) do
      test_path = "/tmp/henpeck.test"
      File.open(test_path, "w")
      Henpecked.config do
        cmd_file test_path
      end
    end

    it "should be able to push alert" do      
      lambda do
        Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)
      end.should_not raise_error
    end

    it "should append to a file" do
      Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)
      Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)        
      Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)
      File.foreach("/tmp/henpeck.test").inject(0) {|c, line| c+1}.should eql(2)
    end

  end

end
