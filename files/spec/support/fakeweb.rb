require 'fakeweb'

FakeWeb.allow_net_connect = false
FakeWeb::StubSocket.class_eval do
  def read_timeout=(ignored)
  end
end
