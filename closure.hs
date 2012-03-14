-- Copyright © 2010 Bart Massey
-- Transitive closure (reflexive and irreflexive)

import Data.Function (fix)
import Data.Set (Set, toList, union, unions, singleton, empty, (\\))
import qualified Data.Set as Set

bigUnion :: Ord a => Set (Set a) -> Set a
bigUnion = unions . toList

type Close a = Set a -> (a -> Set a) -> Set a

expansion :: Ord a => Close a
expansion source expand = 
  bigUnion (Set.map expand source)

step :: Ord a => (Set a -> Set a) -> Close a
step f source expand =
  let step = expansion source expand \\ source in
  let expanded = source `union` f step in
  if Set.null step then source else expanded

closeRT :: Ord a => Close a
closeRT source expand =
  fix closeStep source
  where
    closeStep f source = step f source expand
    
closeT :: Ord a => Close a
closeT source expand =
  fix closeStep (expansion source expand)
  where
    closeStep f source = step f source expand
    
smallBump :: Int -> Set Int
smallBump n
  | n < 12 = singleton (n + 2)
  | otherwise = empty

