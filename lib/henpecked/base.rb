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

    class AcknowledgeHostProblemExpire < AbstractAlert

      def initialize(host_name = nil, sticky = nil, notify = nil, persistent = nil, timestamp = nil, author = nil, comment = nil)
        @host_name = host_name
        @sticky = sticky
        @notify = notify
        @persistent = persistent
        @timestamp = timestamp
        @author = author
        @comment = comment
      end    

      def arguments
        [@host_name, @sticky, @notify, @persistent, @timestamp, @author, @comment].join(";")
      end

    end # end of AcknowledgeHostProblemExpire class
      
    class DisableHostCheck < AbstractAlert

      def initialize(host_name = nil)
        @host_name = host_name
      end

      def arguments
        @host_name
      end

    end # end of DisableHostCheck class

    class SendCustomHostNotification < AbstractAlert

      def initialize(host_name = nil, options = nil, author = nil, comment = nil)
        @host_name = host_name
        @options = options 
        @author = author
        @comment = comment
      end

      def arguments
        [@host_name, @options, @author, @comment].join(";")
      end

    end # end of SendCustomHostNotificatio class
    

  end

end


