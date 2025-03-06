// General English stuff
#let ie = [_i.e._]

// General math stuff
#let field = math.bold("F")
#let reals = math.bold("R")
#let complex = math.bold("C")
#let to = math.arrow
#let implies = math.arrow.r.double

// Misc. math stuff
#let gbar = $overline(g)$
#let dbar = $overline(d)$

// Probabilistic implications
#let impliesp = $limits(arrow.r.double)_p$

// Linear algebra stuff
#let span = math.op(math.cal("R"))
#let nullspace = math.op(math.cal("N"))

// Optimization stuff
#let problem(sign, objective, constraints: ()) = {
  $
    sign & #h(1em) && #objective \
    #for i in range(constraints.len()) {
      if i == 0 {
        $ "subject to" & #h(1em) && #constraints.at(i) \ $
      } else {
        $ & #h(1em) && #constraints.at(i) \ $
      }
    }
  $
}