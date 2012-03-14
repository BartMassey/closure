-- Copyright © 2012 Bart Massey
-- Transitive closure (reflexive and irreflexive)

module Closure(closeT, closeRT)
where

import Data.Function (fix)
import Data.Set (Set, toList, union, unions, singleton, empty, (\\))
import qualified Data.Set as Set

bigUnion :: Ord a => Set (Set a) -> Set a
bigUnion = unions . toList

type Close a = (a -> Set a) -> (Set a -> Set a)

expansion :: Ord a => Close a
expansion expand source = 
  bigUnion (Set.map expand source)

step :: Ord a => (a -> Set a) -> (Set a -> Set a) -> (Set a -> Set a)
step expand f source =
  let step = expansion expand source \\ source in
  let expanded = source `union` f step in
  if Set.null step then source else expanded

closeRT :: Ord a => Close a
closeRT expand source =
  fix (step expand) source
    
closeT :: Ord a => Close a
closeT expand source =
  fix (step expand) (expansion expand source)
