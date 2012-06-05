# -*- encoding : utf-8 -*-
require 'spec_helper'
class AdminUser < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :log, :hashed_code, :banner_content_type, :banner_file_name, :banner_file_size
  has_attached_file :banner,
                    storage: :s3,
                    bucket: ENV['AMAZON_S3_BUCKET'],
                    path: "banners/:id.:extension",
                    s3_permissions: :public_read,
                    s3_credentials: {
                      access_key_id: ENV['AMAZON_ACCESS_KEY_ID'],
                      secret_access_key: ENV['AMAZON_SECRET_ACCESS_KEY']
                    }
  
end

describe ApplicationHelper do
  let(:admin_user) { AdminUser.new(first_name: 'More or less', banner_file_name: 'banner.png', banner_file_size: 320) }
  describe "display_text" do
    context :log do
      it "should return field" do
        helper.display_text(admin_user, 'log').should == "<pre></pre>"
      end
    end
    context :other do
      it "should return field" do
        helper.display_text(admin_user, 'last_name').should be_nil
      end
    end
  end
  describe "display_paperclip" do
    context "image" do
      it "should return field" do
        admin_user.banner_content_type = "image/png"
        helper.display_paperclip(admin_user, 'banner').should == "<img alt=\".png\" src=\"http://s3.amazonaws.com/websimulado-development/banners/.png\" />"
      end
    end
    context "other" do
      it "should return field" do
        helper.display_paperclip(admin_user, 'banner').should == "<a href=\"http://s3.amazonaws.com/websimulado-development/banners/.png\">banner.png</a>"
      end
    end
  end
  describe "table_paperclip_field" do
    it "should return field" do
      helper.table_paperclip_field('banner', admin_user).should == "<a href=\"http://s3.amazonaws.com/websimulado-development/banners/.png\">banner.png</a>"
    end
  end
  describe "display_string" do
    context "order hashed_code" do
      context "finished" do
        before do
          admin_user.stub!(:hashed_code).and_return('hashed_code')
        end
        it "should return message" do
          helper.display_string(admin_user, 'hashed_code').should =~ /href/
        end
      end
      context "new" do
        it "should return message" do
          helper.display_string(admin_user, 'hashed_code').should == "Ainda não gerado."
        end
      end
    end
    context "other" do
      it "should return message" do
        helper.display_string(admin_user, 'first_name').should == "More or less"
      end
    end
  end
end