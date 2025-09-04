#import "./template.typ": *

#show: conf.with(
  title:   "Практика по предмету",
  subject: "Теория автоматического регулирования",
  teacher: "Суханов",
)

= Определение приближённой математической модели элемента автоматической системы по виду переходной функции

3 формы переходной функции:
+ Стандартная;
+ Операторная;
+ Структурная;

\

Классификации звеньев:
+ Позиционные $nu = "const" != 0$;
+ Диффиренцирующие $nu = 0$;
+ Интегрирующие $nu = infinity$;

#figure(
  [
    #cetz.canvas({
      import cetz.draw: *
      set-style(
        mark: (
          transform-shape: false,
          fill: black
        )
      )

      rect(name:"зу",(0,0),(1,1))
      circle(name:"lamp1",(2.5,0.5),radius:0.5)
      arc((2.5,.5),radius:0.5,mode:"PIE",   start:225deg, delta:90deg, fill:black, anchor:"origin")
      arc((2.5,.5),radius:0.5,mode:"CLOSE", start:45deg, delta:180deg, anchor:"origin")
      arc((2.5,.5),radius:0.5,mode:"CLOSE", start:-45deg, delta:180deg, anchor:"origin")

      circle(name:"lamp2",(8.5,0.5),radius:0.5)
      arc((8.5,.5),radius:0.5,mode:"PIE",   start:-225deg, delta:-90deg, fill:black, anchor:"origin")
      arc((8.5,.5),radius:0.5,mode:"CLOSE", start:45deg, delta:180deg, anchor:"origin")
      arc((8.5,.5),radius:0.5,mode:"CLOSE", start:-45deg, delta:180deg, anchor:"origin")

      line(name:"nug", (8.5,2),(8.5,1), mark:(end:"stealth") )
      content("nug.mid", $nu_Г$, anchor:"south-east", padding:.1)

      rect(name:"у" ,(3.5,0),(5,1))
      rect(name:"ро",(6,0),(7.5,1))
      rect(name:"ор",(9.5,0),(10.5,1))
      rect(name:"чэ",(6,-2),(7,-3))

      content("зу","зу")
      content("у" ,$1/(T_s  lambda + 1)$ )
      content("ро",$1/(T_pi lambda + 1)$)
      content("ор",$1/(T_a lambda)$)
      content("чэ",$1/delta_omega$)

      line((1,.5),(2,.5))
      line((1,.5),(1.5,.5),mark:(end:"stealth") )
      line((3,.5),(3.5,.5))
      line((3,.5),(3.4,.5),mark:(end:"stealth") )
      line((5,.5),(6,.5))
      line((5,.5),(5.7,.5),mark:(end:"stealth") )
      content((5.5,1),$xi$,anchor:"south")
      line((7.5,.5),(8,.5))
      line((7.5,.5),(7.9,.5),mark:(end:"stealth") )

      line((2.5,0),(2.5,-2.5),(6,-2.5))
      line((11,0.5),(11,-2.5),(7,-2.5))
      line((5,-2.5),(4,-2.5),mark:(end:"stealth") )
      line((9,-2.5),(8,-2.5),mark:(end:"stealth") )

      line((9,.5),(9.5,.5), mark:(end:"stealth") )
      content((11,1),$phi$)
      content("lamp1.north-east", $eta$, anchor:"south-west")
      content("lamp2.north-west", $pi$, anchor:"south-east")
      content("зу.north-east",   $zeta_"му"$, anchor:"south-west")
      line((10.5,.5),(11.5,.5), mark:(end:"stealth") )

      ////////////////////////////////////////////////

      
    })
  ],
  caption: [Структурная схема матмодели САР],
)
