require 'spec_helper'

describe "Word Scramble App" do
  def app 
    @app ||= WordScramble::App
  end

  describe "home page" do
    it "doesn't crash" do
      get '/'
      last_response.status.should == 200
    end
  end

  describe "/descramble" do
    it "returns a list of words" do
      get '/descramble/realapin.json'
      last_response.body.should match("airplane")
    end
  end
end
