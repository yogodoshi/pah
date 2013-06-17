require 'spec_helper'

describe Content do
  it { should allow_mass_assignment_of(:text).as(:admin) }
  [:name, :slug, :text].each do |attribute|
    it { should validate_presence_of(attribute) }
  end
  describe ".markdown" do
    context "content exists" do
      before do
        Factory.create(:content)
      end
      it "should return markdown of text of content with slug" do
        Content.markdown(:tagline).should == "<p>Texto <strong>legal</strong> e <em>bacana</em></p>\n"
      end      
    end
    context "content does not exists" do
      it "should return nil" do
        Content.markdown(:tagline).should be_nil
      end
    end
  end
  describe ".raw" do
    context "content exists" do
      before do
        Factory.create(:content)
      end
      it "should return raw text of content with slug" do
        Content.raw(:tagline).should == "Texto **legal** e <em>bacana</em>"
      end
    end
    context "content does not exists" do
      it "should return nil" do
        Content.raw(:tagline).should be_nil
      end
    end
  end
  describe ".ensure" do
    context "content does not exists" do
      it "should create content" do
        expect {
          Content.ensure(:tagline, 'Tagline', 'Texto legal')
        }.to change(Content, :count).by(1)
      end
      describe "created content" do
        before do
          Content.ensure(:tagline, 'Tagline', 'Texto legal')
        end
        subject { Content.last }
        its(:slug) { should == 'tagline' }
        its(:name) { should == 'Tagline' }
        its(:text) { should == 'Texto legal' }
      end
    end
    context "content already exists" do
      let!(:content) { Factory.create(:content) }
      it "should not create content" do
        expect {
          Content.ensure(:tagline, 'Tagline 1', 'Texto legal 1')
        }.not_to change(Content, :count)
      end
    end
  end
end
