import System.Random
import Control.Applicative (liftA3)
import Control.Monad (replicateM)
import Control.Monad.Trans.State

data Die = 
    DieOne
  | DieTwo
  | DieThree
  | DieFour
  | DieFive
  | DieSix
  deriving (Show, Eq)

intToDie :: Int -> Die
intToDie n =
    case n of
        1 -> DieOne
        2 -> DieTwo
        3 -> DieThree
        4 -> DieFour
        5 -> DieFive
        6 -> DieSix
        _ -> error $ "intToDie go non 1-6 integer: " ++ show n

rollDieThreeTimes :: (Die, Die, Die)
rollDieThreeTimes = do
    let s = mkStdGen 0
        (d1, s1) = randomR (1, 6) s
        (d2, s2) = randomR (1, 6) s1
        (d3, _) = randomR (1, 6) s2
    (intToDie d1, intToDie d2, intToDie d3)

rollOneDie s = do
    let (d1, s1) = randomR (1, 6) s
    (intToDie d1, s1)

rollDie :: State StdGen Die
rollDie = state $ do
    (d, s) <- randomR (1, 6)
    return (intToDie d, s)

rollDie' :: State StdGen Die
rollDie' = state rollOneDie
-- (\s -> 
--                         let (d, s1) = randomR (1, 6) s
--                         in (intToDie d, s1)
--                  )

rollDieThrice = liftA3 (,,) rollDie rollDie rollDie

nDie :: Int -> State StdGen [Die]
nDie n = replicateM n rollDie

rollsToGenTwenty :: StdGen -> Int
rollsToGenTwenty g = go 0 0 g
    where go :: Int -> Int -> StdGen -> Int
          go sum count gen
            | sum >= 20 = count
            | otherwise =
                let (die, nextGen) = randomR (1, 6) gen
                in go (die + sum) (count + 1) nextGen

rollsToGetN :: StdGen -> Int -> Int
rollsToGetN g limit = go 0 0 limit g
    where go :: Int -> Int -> Int -> StdGen -> Int
          go sum count limit gen
            | sum >= limit = count
            | otherwise =
                let (die, nextGen) = randomR (1, 6) gen
                in go (die + sum) (count + 1) limit nextGen

rollsCountLogged :: StdGen -> Int -> (Int, [Die])
rollsCountLogged g limit = go 0 0 limit g []
    where go :: Int -> Int -> Int -> StdGen -> [Die] -> (Int, [Die])
          go sum count limit gen dieList
            | sum >= limit = (count, dieList)
            | otherwise =
                let (die, nextGen) = randomR (1, 6) gen
                in go (die + sum) (count + 1) limit nextGen ((intToDie die) : dieList)