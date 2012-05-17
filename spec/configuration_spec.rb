require 'spec_helper'

describe Henpecked do


  it "should be able to set command file path" do
    lambda do
      Henpecked.config do
        cmd_file "spec/spec_helper.rb"
      end
    end.should_not raise_error
  end

  it "should blow up if command file is not set" do
    lambda do
      Henpecked.config do
        cmd_file "/does/not/exists"
      end
    end.should raise_error
  end

  it "should return cmd file path" do
    Henpecked.config do
      cmd_file "spec/spec_helper.rb"
    end
    Henpecked.file_path.should eql("spec/spec_helper.rb")
  end

end