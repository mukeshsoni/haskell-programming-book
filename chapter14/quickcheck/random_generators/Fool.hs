-- to run the tests, simply do this on the terminal 
-- $ runhaskell <file_name>
-- You can also start a `ghci` session, load this file (:l) and then run main
import Test.QuickCheck

data Fool = Fulse | Frue deriving Show

genFulse :: Gen Fool
genFulse = oneof [return Fulse, return Frue]

-- 2/3rd chance of Fulse, 1/3rd chance of Frue
genFulse2 :: Gen Fool
genFulse2 = frequency [(2, return Fulse), (1, return Frue)]

main = do
    putStrLn "Equal chance of getting Fulse or Frue"
    sample genFulse
    putStrLn "2/3rd chance Fulse, 1/3rd chance Frue"
    sample genFulse2