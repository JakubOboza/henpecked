module Henpecked

  @@config = {}

  def self.config(&block)
    self.instance_eval &block
  end

  def self.cmd_file(file_path)
    raise Exception.new "Icinga Command file don't exists in this location, check the path" unless File.exists?(file_path)
    @@config[:file_path] = file_path
  end

  def self.file_path
    return @@config[:file_path] if @@config[:file_path]
    raise Exception.new "Icinga Command file not specified"
  end

end