# -*- encoding : utf-8 -*-
module OmniauthLoginTestHelper
  def current_user
    @current_user ||= Factory.create(:user)
  end

  def login!
    session[:user_id] = current_user.id
  end
end

RSpec.configure do |config|
  config.include OmniauthLoginTestHelper, type: :controller
  config.include OmniauthLoginTestHelper, type: :helper
end

shared_examples_for "authentication_required_action" do
  context "not logged in" do
    before do
      http_basic_login!
      request.env["HTTP_REFERER"] = '/back'
      do_action 
    end
    it { should redirect_to("/back") }
    it { flash[:notice].should == "Você precisa estar logado..." }
  end
end
