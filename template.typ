// Импорт сторонних пакетов
#import "@preview/showybox:2.0.4": showybox // Коробки
#import "@preview/physica:0.9.5": *         // Физические формулы
#import "@preview/cetz:0.4.1"               // Диаграммы
#import "@preview/lilaq:0.4.0" as lq        // Графики
#import "@preview/pinit:0.2.2": *           // Выделение
#import "@preview/mannot:0.3.0": *          // Математические аннотации
#import "@preview/tiptoe:0.3.1"             // Стрелочки
#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

#let conf(
  title:   "Конспект",
  subject: "Обыкновенный",
  teacher: "Господь-Бог",
  body
) = {
  set text(
    font: "Times New Roman",
    size: 14pt,
    lang: "ru"
  )
  set page(
    paper: "a4",
    margin: (x:1.5cm, y:1.5cm),
    numbering: "1",
    number-align: right,
  )
  set par(
    justify: true,
    first-line-indent: (amount: 1.25cm, all: true)
  )

  // Leading fix
  let leading = 1.5em - 0.75em // "Normalization"
  set block(spacing: leading)
  set par(spacing:leading, leading:leading)

  // Название
  align(center)[
    #text(17pt)[   *  #title  *   ] \
    #text(20pt)[ _ * #subject * _ ]
  ]
  linebreak()

  grid(
    columns: (1fr, 1fr),
    figure(
      cetz.canvas({
        import cetz.draw: *

        circle((0,0), name:"circle", radius:1.2, stroke:none)
        for a in (0deg, 60deg, 120deg, 180deg, 240deg, 300deg) {
          content((name:"circle", anchor:a), angle:a+120deg, text( fill: if calc.even(int(a/60deg)) == true {rgb("#B8BB26")} else {rgb("#83A598")}, size:84pt)[#sym.lambda])
        }
        content((0, -.12), emph(text(fill:red, size:28pt)[#sym.integral.cont]))
      })
    ),
    [
      _Преподаватель_: \
      * #teacher * \
      \
      _Автор конспекта_: \
      *Дмитриев Артем Константинович* \
      #link("mailto:artem020503@gmail.com")
    ]
  )
  
  // Содержание
  show outline: it => {
    show heading: set align(center)
    show heading: set text(14pt)
    show heading: set block(above: 1.4em, below: 1em)
    it
  }
  outline(
    title: "СОДЕРЖАНИЕ",
    indent: auto
  )

  // Заголовки
  set heading(numbering: "1.")
  show heading.where(
    level: 1
  ): it => {
    pagebreak(weak:true)
    set text(hyphenate: false)
    set align(center)
    set block(above: 1.4em, below: 1em)
    it
  }
  show heading: it => {
    set text(hyphenate: false)
    // set align(center)
    set block(above: 1.4em, below: 1em)
    it
  }

  body
}

// Функции

#let teo(name: "Теорема", text) = {
  showybox(
    title: name,
    frame:(
      title-color:  silver,
      body-color:   silver.lighten(50%),
      border-color: gray,
      radius: 2pt
    ),
    title-style:(
      boxed-style:(
        anchor: (:),
        radius: 2pt
      ),
      color: black
    ),
    text
  )
}

#let imp(name: "Важно!", text) = {
  showybox(
    title: [* #name *],
    frame:(
      title-color:  rgb("#ED1F53"),
      body-color:   rgb("#FCE4DF"),
      border-color: rgb("#ED1F53"),
      radius: 2pt
    ),
    title-style:(
      boxed-style:(anchor:(:)),
      color: white,
      radius: 2pt
    ),
    text
  )
}

#let pinit-highlight-equation-from(height: 2em, pos: bottom, fill: rgb(0, 180, 255), highlight-pins, point-pin, body) = {
  pinit-highlight(..highlight-pins, dy: -0.9em, fill: rgb(..fill.components().slice(0, -1), 40))
  pinit-point-from(
    fill: fill, pin-dx: 0em, pin-dy: if pos == bottom { 0.5em } else { -0.9em }, body-dx: 0pt, body-dy: if pos == bottom { -1.7em } else { -1.6em }, offset-dx: 0em, offset-dy: if pos == bottom { 0.8em + height } else { -0.6em - height },
    point-pin,
    rect(
      inset: 0.5em,
      stroke: (bottom: 0.12em + fill),
      {
        set text(fill: fill)
        body
      }
    )
  )
}
