require "spec_helper"

describe Isbumiawake do
  describe "notify" do
    context "with token" do
      it "should post to isbumiawake" do
        RestClient.should_receive(:post).with("https://isbumiawake.herokuapp.com/c/beirut", :message => "hello beirut")
        Isbumiawake.notify("beirut", :message => "hello beirut")
      end
    end

    context "with url" do
      it "should post to isbumiawake" do
        RestClient.should_receive(:post).with("https://isbumiawake.com/c/beirut", :message => "hello beirut")
        Isbumiawake.notify("https://isbumiawake.com/c/beirut", :message => "hello beirut")
      end
    end

  end
end
