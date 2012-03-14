-- Copyright © 2012 Bart Massey
-- Transitive closure (reflexive and irreflexive)

module Closure(closeT, closeRT)
where

import Data.Function (fix)
import Data.Set (Set, toList, union, unions, singleton, empty, (\\))
import qualified Data.Set as Set

bigUnion :: Ord a => Set (Set a) -> Set a
bigUnion = unions . toList

type Close a = Set a -> (a -> Set a) -> Set a

expansion :: Ord a => Close a
expansion source expand = 
  bigUnion (Set.map expand source)

step :: Ord a => (a -> Set a) -> (Set a -> Set a) -> (Set a -> Set a)
step expand f source =
  let step = expansion source expand \\ source in
  let expanded = source `union` f step in
  if Set.null step then source else expanded

closeRT :: Ord a => Close a
closeRT source expand =
  fix (step expand) source
    
closeT :: Ord a => Close a
closeT source expand =
  fix (step expand) (expansion source expand)
