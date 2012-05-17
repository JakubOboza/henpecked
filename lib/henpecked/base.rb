module Henpecked
  module Alert


    # definition of alert template
    class AbstractAlert

      def initialize
        raise "Should be implemented in concrete class! Don't use abstract class"
      end

      def time
        "[#{Time.now.to_i}]"
      end

      def command
        "#{ActiveSupport::Inflector.underscore(self.class.to_s.split(/:/).last).upcase};"
      end

      def arguments
        raise "Should be implemented in concrete class! Don't use abstract class"
      end

      def icinga_description
        [self.time, self.command, self.arguments].join(" ")
      end

    end 

    class AcknowledgeHostProblem < AbstractAlert

      def initialize(host_name = nil, sticky = nil, notify = nil, persistent = nil, author = nil, comment = nil)
        @host_name = host_name
        @sticky = sticky
        @notify = notify
        @persistent = persistent
        @author = author
        @comment = comment
      end
        
      def arguments
        [@host_name, @sticky, @notify, @persistent, @author, @comment].join(";")
      end

    end # end of AcknowledgeHostProblem class

  end

end