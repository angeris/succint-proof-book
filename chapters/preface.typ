#import "../vanilla-fullpage-book.typ": paragraph

#heading(numbering: none)[Preface]
This book is about constructing, proving the security of, and programming a
complete, end-to-end succinct proof system. There are many other phenomenal
books which take a general approach to these systems and describe the
(relatively young) field as a whole. On the other hand, this book is highly
opinionated and focuses on a specific, concrete, and very simple system that can
be understood, proven, and implemented by anyone with a basic background in
computer science and basic undergraduate mathematics. We assume the reader has
had a basic introduction to linear algebra, is familiar with probability, and
has familiarity with any one of the following: finite mathematics, number
theory, group theory, or any similar class. (Some familiarity with proofs,
modular arithmetic, and the existence of inverses modulo primes suffices for
this book, though some basic knowledge of coding theory may also be helpful.)
For the implementation part of the book, we will assume some basic coding
experience in any language, though our examples and code will be in the Julia
programming language as it is relatively fast and will allow our code to look
very similar to the math we write.


#paragraph[Who this book is for.] This book should serve as a general guide for
anyone with a small amount of mathematical sophistication to be introduced to
the field while presenting the small amount of material necessary to understand
and implement one particular succinct proof system. It is not intended to be an
exhaustive reference on the field, but rather a very opinionated introduction
that can serve as a stepping stone to more advanced topics.

#paragraph[Exercises.] The book contains a number of exercises and it is the
intention that readers work through the exercies which they find most
interesting---working through at least some portion of these in each chapter.