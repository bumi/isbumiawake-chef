require "spec_helper"
describe Isbumiawake::Chef::Handler do
  subject { Isbumiawake::Chef::Handler.new(:url => "http://isbumiawake.com/foo") }

  its(:url) { should eql(URI.parse("http://isbumiawake.com/foo")) }

  describe "report" do
    let(:handler) { Isbumiawake::Chef::Handler.new(:url => "http://Isbumiawake.com/foo") }
    before { handler.should_receive(:message).and_return("chef report") }
    before { Net::HTTP.should_receive(:post_form).with(handler.url, {:message => "chef report"}).and_return(mock(:body => "yeah")) }
    subject { handler }
    its(:report) { should eql("yeah") } # just check for the return value and mock the net http part
  end

  describe "message" do
    let(:handler) { Isbumiawake::Chef::Handler.new(:url => "http://Isbumiawake.com/foo") }
    before {
      handler.should_receive(:node).and_return(mock(:fqdn => "host"))
      handler.should_receive(:status).and_return("success")
      handler.should_receive(:elapsed_time).and_return(10)
      handler.should_receive(:start_time).and_return("12:34")
      handler.should_receive(:end_time).and_return("12:45")
      handler.should_receive(:updated_resources).and_return(["list", "of", "resources"])
    }
    subject { handler }
    its(:message) { should eql("Chef run on node host success completed in 10 (12:34-12:45) and updated: list,of,resources") }
  end

end
