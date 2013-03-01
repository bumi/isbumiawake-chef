require "restclient"
module Isbumiawake
  autoload :Chef, "isbumiawake/chef"
  autoload :Rake, "isbumiawake/rake"

  def self.notify(token_or_url, args= {})
    RestClient.post(self.url_for(token_or_url), :message => args[:message])
  end

  def self.url_for(token_or_url)
    if token_or_url =~ /https?:\/\//i
      token_or_url
    else
      "https://isbumiawake.herokuapp.com/c/#{token_or_url}"
    end
  end

end
