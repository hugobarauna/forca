# encoding: UTF-8

require 'spec_helper'
require 'word_raffler'

describe WordRaffler do
  it "raffles a word from a given list of words" do
    words = %w(me you nice)
    raffler = WordRaffler.new(words)

    expect(raffler.raffle(3)).to eq("you")
    expect(raffler.raffle(2)).to eq("me")
    expect(raffler.raffle(4)).to eq("nice")
  end

  it "returns nil if it doesn't have a word with the given length" do
    words = %w(me you nice)
    raffler = WordRaffler.new(words)

    expect(raffler.raffle(20)).to be_nil
  end
end
