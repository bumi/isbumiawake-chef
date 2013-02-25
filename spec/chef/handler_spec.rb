require "spec_helper"
describe Isbumiawake::Chef::Handler do
  subject { Isbumiawake::Chef::Handler.new("url" => "http://isbumiawake.com/foo") }


  describe "report" do
    let(:handler) { Isbumiawake::Chef::Handler.new("url" => "http://Isbumiawake.com/foo") }
    before { handler.should_receive(:message).and_return("chef report") }
    before { RestClient.should_receive(:post).with("http://Isbumiawake.com/foo", {:message => "chef report"}).and_return("yeah") }
    subject { handler }
    its(:report) { should eql("yeah") } # just check for the return value and mock the net http part
  end

  describe "message" do
    let(:handler) { Isbumiawake::Chef::Handler.new("url" => "http://Isbumiawake.com/foo") }
    before {
      handler.should_receive(:node).and_return(mock(:fqdn => "host"))
      handler.should_receive(:success?).and_return(true)
      handler.should_receive(:elapsed_time).and_return(10)
      handler.should_receive(:start_time).and_return("12:34")
      handler.should_receive(:end_time).and_return("12:45")
      handler.should_receive(:updated_resources).and_return(["list", "of", "resources"])
    }
    subject { handler }
    its(:message) { should eql("Chef run on node host successfully completed in 10 (12:34-12:45) and updated: list,of,resources") }
  end

end
