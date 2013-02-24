require "net/http"
require "open-uri"
require 'chef/handler'
module Isbumiawake
  module Chef
    class Handler < ::Chef::Handler

      def initialize(args)
        @url = args["url"]
      end

      def report
        open(self.url)#, :message => self.message).body
      end

      def url
        URI.parse(@url)
      end

      def message
        "Chef run on node #{node.fqdn} #{success? ? "successfully" : "NOT successfully"} completed in #{elapsed_time} (#{start_time}-#{end_time}) and updated: #{updated_resources.join(",")}"
      end
    end
  end
end
