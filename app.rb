require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'word_scramble'

module WordScramble
  class API < Grape::API
    default_format :json

    get '/descramble/:word' do
      descrambler = WordScramble::Descrambler.new(params[:word])
      descrambler.matching_words
    end

  end

  App = Rack::Cascade.new([
    Rack::File.new("public/index.html"),
    WordScramble::API
    ])
end
