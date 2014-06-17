require "observium/agent/version"

module Observium
  module Agent
    extend self

    def defaults
      {
        port: 6556,
        timeout: 5
      }
    end

  end
end
