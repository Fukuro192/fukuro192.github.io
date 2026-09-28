# frozen_string_literal: true

# Log HTTP requests during `jekyll serve` in development.
# Jekyll clears WEBrick's AccessLog by default.

return unless Jekyll.env == "development"

require "webrick"
require "jekyll/commands/serve"

module Jekyll
  module Commands
    class Serve
      class << self
        def enable_logging(opts)
          opts[:AccessLog] = [
            [$stdout, WEBrick::AccessLog::COMBINED_LOG_FORMAT]
          ]
          level = WEBrick::Log.const_get(
            opts[:JekyllOptions]["verbose"] ? :DEBUG : :WARN
          )
          opts[:Logger] = WEBrick::Log.new($stdout, level)
        end
      end
    end
  end
end
