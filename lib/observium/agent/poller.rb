module Observium
  module Agent
    class Poller
      def initialize(host, **args)
        @host    = host
        @port    = args[:port]    || Observium::Agent.defaults[:port]
        @timeout = args[:timeout] || Observium::Agent.defaults[:timeout]
      end

      # Connects to the given host on the agent port to get the agent
      # output.  Connection times out after 5 seconds.
      # 
      # Raises a PollingFailed error if no data was output, or the command failed
      #
      # Returns the raw output returned by the agent as a multiline string
      def poll
        @output = %x(nc -w #{@timeout} #{@host} #{@port} 2>&1)
        
        $?.success? or raise Errors::PollingFailed, "Agent check failed: #{error_msg}"
        has_data?   or raise Errors::PollingFailed, "Agent didn't return any data"

        @output
      end

      private

      # Checks if the agent returned any data, usually signified by more than a
      # single line being present in the output
      def has_data?
        @output.lines.count > 1
      end

      # Parses the error message from the netcat error output to stderr
      def error_msg
        @output.split(":").last.strip
      end
    end
  end
end