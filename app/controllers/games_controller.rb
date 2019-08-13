require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { [*'A'..'Z'].sample }
  end

  def score
    @letters = params[:letters]
    @word = params[:word]
    @url = "https://api.github.com/users/#{@word}"
    @user_serialized = open(@url).read
    @user = JSON.parse(@user_serialized)
    if @user["found"]
      @score = "Yeah #{@word} is valid!"
    end
  end
end
