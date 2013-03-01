require "isbumiawake"
require 'chef/handler'
module Isbumiawake
  module Chef
    class Handler < ::Chef::Handler
      attr_accessor :token
      def initialize(args)
        @token = args["url"] || args["token"]
      end

      def report
        Isbumiawake.notify @token, :message => self.message
      end

      def message
        "Chef run on node #{node.fqdn} #{success? ? "successfully" : "NOT successfully"} completed in #{elapsed_time} (#{start_time}-#{end_time}) and updated: #{updated_resources.join(",")}"
      end
    end
  end
end
