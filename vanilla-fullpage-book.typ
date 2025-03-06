#let title_format(title) = {
  set text(size: 20pt, weight: 500)
  set align(horizon + center)

  title
}

#let email_format(email) = {
    set text(font: "DejaVu Sans Mono", weight:500, size:9pt)
    link("mailto:"+email)
}

#let authors_format(authors) = {
  set align(center)
  set text(size: 14pt)
  let count = authors.len()
  let ncols = calc.min(count, 3)
  set par(leading: .8em)
  grid(
    columns: (1fr,) * ncols,
    row-gutter: 24pt,
    ..authors.map(author => [
      #author.name \
      #email_format(author.email)
    ])
  )
}

#let date_format(date) = {
  set align(center)
  set text(size: 14pt)
  date
}

#let abstract(abs) = {
  set align(center)
  pad(bottom: .2in, left: .25in, right: .25in, top:.25in)[
      *Abstract*

      #set align(left)
      #set par(leading: .6em, first-line-indent: 1em)
      #set text(size: 11pt)
      
      #abs
  ]
}

#let template(
  title: none,
  authors: (),
  date: none,
  doc
) = {
  // Page stuff
  set page(
    paper: "us-letter",
    margin: (x: 1in, y: 1in),
    numbering: "1",
  )
  
  // Text stuff
  set text(
    font: "New Computer Modern",
    size: 12pt,
    spacing: 70%
  )

  // Heading stuff
  set heading(numbering: "1.1.1   ")
  show heading: set block(below: .7em, above: 1.5em)
  show heading.where(level: 4): it => {
      v(.5em)
      text(
      size: 12pt,
      weight: "bold",
      block(spacing: .65em) + box(it.body + h(.4em)),
    )
  }

  title_format(title)
  v(2em)
  authors_format(authors)
  v(2em)
  date_format(date)
  pagebreak()

  // More text stuff
  set par(
    first-line-indent: 1em,
    justify: true,
    spacing: .65em
  )
  
  // == Equation environment stuff
  // Make spacing for block equations correct
  show math.equation.where(block: true): set block(spacing: 1.2em)
  // Do not automatically scale inline equation parentheses
  show math.equation.where(block: false): eq => {
    show math.lr: it => it.body
    show math.attach: it => {
      if it.base.func() != math.lr {
        return it
      }
      
      let fields = it.fields()
      let right = math.attach(none, t: fields.t, b: fields.b)
      let left = if fields.tl != none or fields.bl != none {
        math.attach(none, tl: fields.tl, bl: fields.bl)
      }
      
      left + it.base + right
    }
    eq
  }
  // Only number equations which have labels (thanks to
  // https://forum.typst.app/t/how-to-conditionally-enable-equation-numbering-for-labeled-equations/977/14 )
  set math.equation(numbering: "(1)")
  show math.equation: it => {
    if it.block and not it.has("label") [
      #counter(math.equation).update(v => v - 1)
      #math.equation(it.body, block: true, numbering: none)#label("")
    ] else {
      it
    }  
  }
  // Does not write out `Equation XXX` when referencing an equation. Taken from
  // https://typst.app/docs/reference/model/ref/
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      // Override equation references.
      link(el.location(),numbering(
        el.numbering,
        ..counter(math.equation).at(el.location())
      ))
    } else {
      // Other references as usual.
      it
    }
  }
    
  // And that's all!
  doc
}

#let paragraph(body) = {
  heading(body, depth: 4, numbering: none, outlined: false)
}