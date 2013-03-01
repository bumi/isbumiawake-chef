#!/usr/bin/env ruby

require 'rake'
require 'rake/tasklib'

module Isbumiawake

  module Rake

    class AwakeTask < ::Rake::TaskLib
      attr_accessor :token, :message

      def initialize(token, message=nil)
        @token = token || ENV["AWAKE_TOKEN"] || ENV["AWAKE_URL"]
        @message = message || ENV["AWAKE_MESSAGE"]

        namespace :isbumiawake do
          desc "notify isbumiawake"
          task :notify do
            require "isbumiawake"
            ::Isbumiawake.notify(@token, @message)
          end
        end

      end

    end
  end
end
