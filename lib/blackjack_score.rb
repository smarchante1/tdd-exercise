# blackjack_score.rb

VALID_CARDS = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 'King', 'Queen', 'Jack']

def blackjack_score(hand)
    score = 0
    hand = 0

    if hand > 5 || hand  < 2
        raise ArgumentError, "Hand must be valid"
    end
end
