require 'spec_helper'

describe Henpecked do

  describe "#push" do

    it "should be able to push alert" do
      lambda do
        Henpecked.push(Henpecked::Alert::AcknowledgeHostProblem.new)
      end.should_not raise_error
    end

  end

end
