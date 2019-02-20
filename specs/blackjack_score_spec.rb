require 'minitest'
require 'minitest/spec'
require 'minitest/autorun'
require 'minitest/reporters'
require 'minitest/pride'

require_relative '../lib/blackjack_score'

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe 'Blackjack Score' do
  it 'can calculate the score for a pair of number cards' do

    # Arrange
    hand = [3, 4]

    # Act
    score = blackjack_score(hand)

    # Assert <-  You do this part!
    expect(score).must_equal 7
  end

  it 'facecards have values calculated correctly' do
    
    # Arrange
    facecards = ["King", "Queen", "Jack"]

    facecards.each do |facecard|
      score = blackjack_score([facecard, 3])
      expect(score).must_equal 13
    end
  end

  it 'calculates aces as 11 where it does not go over 21' do
    (2..10).each do |card|
      hand = [card, 1]

      expect(blackjack_score(hand)).must_equal (card + 11)
    end
  end

  it 'calculates aces as 1, if an 11 would cause the score to go over 21' do
    hand = ["King", "King", 1]
    expect(blackjack_score(hand)).must_equal 21

    hand = [10, 4, 1]
    expect(blackjack_score(hand)).must_equal 15
  end


  it 'raises an ArgumentError for invalid cards' do
    hand = ["King", "King", "Princess", 1]
    expect{
      (blackjack_score(hand))
    }.must_equal ArgumentError
  end

  it 'raises an ArgumentError for more than 5 cards in the hand' do
    hand = [3, 4, 4, 5, 1, 1]
    expect{
      (blackjack_score(hand))
    }.must_equal ArgumentError
  end
end
