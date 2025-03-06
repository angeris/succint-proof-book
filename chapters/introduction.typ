#import "../defs.typ": *
#import "../vanilla-fullpage-book.typ": paragraph

= Introduction
== Notation
XXX: Matrices uppercase, vectors lowercase, scalars greek. Fields modulo prime
via $field$ and so on.

== Proofs and implications
A _proof_ is an argument that, starting with some propositions, allows the
reader to conclude that another proposition, called the _conclusion_, must be
true, by following a series of valid mathematical steps, which we will call
_implications_. An important observation is that any computation can be viewed
as a proof; #ie, a series of implications. For example, to 'compute' the value
of $3a+1$ when $a=3$, we can write
$
  a=3 quad text("implies") quad quad 3a = 3(3) = 9 quad quad text("implies") quad quad 3a + 1 = 9+1 = 10.
$
(The converse, that every proof can be viewed as a computation, is also true and
is a particularly famous result known as the Curry--Howard correspondence.)

#paragraph[Implication.] One example of a conclusion we will try to prove
throughout the book will be to verify that some provided vector $x$ (for now, an
array of $1000$ integers) is _sparse_, #ie, the vector $x$ contains mostly
zeros. For this example, let's say we would like to show that $x$ contains at
least $750$ zero entries. We can prove this in many ways. For example, if it is
true that for indices $i=1, dots, 750$, the vector satisfies $x_i=0$, then, by
we can conclude that most entries of $x$ are, indeed zero.  (Note again that
this is an implication.) An important observation here is that the converse is
not true: there are many vectors $x$ which are sparse (have at least $750$
zeros) but may have some nonzero entries at the first $750$ indices. Drawing
this conclusion (that $x$ is sparse) from the provided proposition (that the
first $750$ entries are zero) is an example of an implication.

#paragraph[Probabilistic implication.] An interesting observation is that, if we
are satisfied with some small probability of error, it is possible to verify
that a vector is sparse while checking far fewer than $750$ entries. For
example, if we uniformly randomly pick $50$ of the $1000$ entries of $x$, and
find that all $50$ are zero, then the probability that $x$ is not sparse (has
fewer than $750$ zeros) is no more than
$
  (1-(250+1)/1000)^50 < 10^(-6).
$
In other words, the chance we draw the incorrect conclusion that $x$ is sparse
when it is not is less than one in a million. Like the previous, it is very
important to note that the converse is not true: if $x$ is sparse, it need not
be the case that $10$ randomly chosen entries are all zero! Drawing this conclusion
(that $x$ is sparse) from the provided proposition (that the $50$ randomly sampled
entries are zero) is an example of what we will call a _probabilistic
implication_---an implication that, over certain randomness, holds with
some probability of error.

#paragraph[Succinct proof.] This observation is an example of a _succinct
proof_. While we will not develop the tools to define succinctness in full
generality, it will suffice for our purposes to use the following
somewhat-informal definition: a proof of some statement is _succinct_ if it is a
probabilistic argument (like the one above) which requires considerably less
work to verify than any direct proof. While we will not develop general tools to
prove that a given proof is succinct, we will show that any deterministic proof
that $x$ is sparse must check almost all elements of $x$. As this is a major
building block of the succinct proof system we develop, this will essentially
take care of our notion of succinctness for the purposes of this book.

== Probabilistic implications