module Main where

data Suit = Spades | Hearts deriving (Show)
data Rank = Ten | Jack | Queen | King | Ace deriving (Show)
type Card = (Rank, Suit)
type Hand = [Card]

value :: Rank -> Integer
value Ten = 1
value Jack = 2
value Queen = 3
value King = 4
value Ace = 5

cardValue :: Card -> Integer
cardValue (rank, suit) = value rank

-- (a) Function biggestCard
biggestCard :: Card -> Card -> Card -> Card
biggestCard card1 card2 card3 =
    maxByValue (maxByValue card1 card2) card3
  where
    maxByValue :: Card -> Card -> Card
    maxByValue c1 c2
      | cardValue c1 >= cardValue c2 = c1
      | otherwise = c2

-- (b) Function sumValue
sumValue :: Hand -> Integer
sumValue hand = sum $ map cardValue hand

-- (c) Function biggestHand
biggestHand :: [Hand] -> Hand
biggestHand hands =
    foldl1 maxByAvg hands
  where
    maxByAvg :: Hand -> Hand -> Hand
    maxByAvg h1 h2
      | avgValue h1 >= avgValue h2 = h1
      | otherwise = h2
    
    avgValue :: Hand -> Integer
    avgValue hand = sumValue hand `div` fromIntegral (length hand)

main :: IO ()
main = do
    putStrLn "Objective (a): Find the biggest card"
    let card1 = (Ten, Hearts)
    let card2 = (Jack, Spades)
    let card3 = (King, Hearts)
    putStrLn $ "Biggest Card: " ++ show (biggestCard card1 card2 card3)

    putStrLn "\nObjective (b): Calculate the sum of values in a hand"
    let hand = [(Ten, Hearts), (Jack, Spades), (King, Hearts)]
    putStrLn $ "Sum of Values in Hand: " ++ show (sumValue hand)

    putStrLn "\nObjective (c): Find the biggest hand"
    let hands = [ [(Ten, Hearts), (Jack, Spades), (King, Hearts)]
                , [(Jack, Spades), (Queen, Hearts), (Ace, Spades)]
                , [(King, Hearts), (Ace, Spades)]
                ]
    putStrLn $ "Biggest Hand: " ++ show (biggestHand hands)
