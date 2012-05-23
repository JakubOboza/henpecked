module Henpecked

  def self.push(alert)
    raise Exception.new "Alert object has to have icinga_description method" unless alert.respond_to?(:icinga_description)
    File.open(Henpecked.file_path, "a") do |file|
    file.write(alert.icinga_description + "\n")
    end
  end

end