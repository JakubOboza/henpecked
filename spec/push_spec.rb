require 'spec_helper'

describe Henpecked do

  describe "#push" do

    it "should be able to push alert" do
      test_path = "/tmp/henpeck.test"
      File.open(test_path, "w")
      lambda do
        Henpecked.config do
          cmd_file test_path
        end
        Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)

      end.should_not raise_error
    end

  end

end
