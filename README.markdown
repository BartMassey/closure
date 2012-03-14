Copyright © 2012 Bart Massey  

Transitive Closure and Reflexive Transitive Closure
Of A Set Relation (in Haskell)

The Haskell module `Closure.hs` in this directory implements
the computation of the transitive closure (TC) and reflexive
transitive closure (TC) of a set relation. The Haskell
program file `closure-demo.hs` is a small demo driver
program.

There are currently no tests of this code, so *caveat
emptor*.

The computation is done using 'Data.Function.fix' and
'Data.Set'. An effort is made to keep the number of
invocations of the relation as small as possible, at the
expense of some extra 'Set' computation. That said, large
closures will yield poor performance.

Arguably, this code should be generalized over 'Data.Monoid'
or some similar class that provides generalized
containers. However, set union is kind of an essential part
of the computation as currently performed, so it's hard to
say what to do. The set difference also provides a
substantial speedup in some situations.

There should be comments. There are no comments.

Have fun!

    Bart Massey <bart@cs.pdx.edu>
    2012-03-14
