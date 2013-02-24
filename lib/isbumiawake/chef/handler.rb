require "net/http"
require 'chef/handler'
module Isbumiawake
  module Chef
    class Handler < ::Chef::Handler

      def initialize(args)
        @url = args[:url]
      end

      def report
        Net::HTTP.post_form(self.url, :message => self.message).body
      end

      def url
        URI.parse(@url)
      end

      def message
        "Chef run on node #{node.fqdn} #{status} completed in #{elapsed_time} (#{start_time}-#{end_time}) and updated: #{updated_resources.join(",")}"
      end
    end
  end
end
