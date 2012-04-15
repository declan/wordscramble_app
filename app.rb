require 'rubygems'
require 'bundler/setup'
require 'grape'
require 'word_scramble'

module WordScramble
  class App < Grape::API

    get '/descramble/:word' do
      descrambler = WordScramble::Descrambler.new(params[:word])
      descrambler.matching_words
    end

  end
end
