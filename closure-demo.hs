-- Copyright © 2012 Bart Massey
-- Demo Closure module
    
import Data.Set (Set, singleton, empty)
import Closure

smallBump :: Int -> Set Int
smallBump n
  | n < 12 = singleton (n + 2)
  | otherwise = empty

main = do
  let s = singleton 3
  print $ closeRT s smallBump
  print $ closeT s smallBump
