require "observium/agent/version"
require "observium/agent/errors"
require "observium/agent/poller"
require "observium/agent/parser"

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
