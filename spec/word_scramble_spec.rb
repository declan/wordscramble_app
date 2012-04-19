require 'spec_helper'

describe "Word Scramble App" do
  def app 
    @app ||= WordScramble::App
  end

  describe "home page", :type => :request do
    it "doesn't crash" do
      get '/'
      last_response.status.should == 200
    end

    it "lets you descramble words" do
      visit '/'
      fill_in "scrambled_input", :with => "liopts"
      click_on "De-scramble"
      page.should have_content("pilots")
      page.should have_content("spoilt")
      page.should have_content("pistol")
    end
  end

  describe "/descramble" do
    it "returns a list of words" do
      get '/descramble/realapin.json'
      last_response.body.should match("airplane")
    end
  end
end
