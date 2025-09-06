#import "./template.typ": *

#show: conf.with(
  title:   "Лекции по предмету",
  subject: "Теория автоматического регулирования",
  teacher: "Суханов",
)

= Условие устойчивости линейных автоматических систем

Для усточивости корни должны быть строго отрицательны.

Необходимое условия устойчивости
- Строгая положительность или отрицательность всех коэффициентов

Критерии устойчивости - у нас известен только критерий Гурвица -- все n диагональных определителей Гурвица строго положительны. Это значит, что все корни характеристического многочлена имеют... система устойчива.

Это _алгебраический критерий_. Ещё есть два алгебраических критерия:
- Льенара-Шипара
- Рауса

(Ещё есть частотный критерй устойчивости)

== Критерий Льенара-Шипара

Возьмём характеристический многочлен:
$ P(lambda) = T_a dot T_pi T_s dot lambda^3 + T_a (T_pi + T_s) dot lambda^2 + T_a dot lambda + 1/delta_omega $
$ P(lambda) = C_0 dot lambda^3 + C_1 dot lambda^2 + C_2 dot lambda + C_3 $

Все $C_i>0$.

Формулировка критерия Льенара-Шипара:

Для асимптотической устойчивости линейной системы необходимо и достаточно, чтобы выполнялись два следующих условия:
+ Все коэффициенты положительные
+ Все четные или нечетные определители Гурвица строго положительные ($Delta_(n-1)>1, Delta_(n-3)>0, Delta_(n-5)>0...$). Четные или нечетные мы рассматриваем --- зависит от n.

$ P(lambda) = 2 dot lambda^4 + 3 dot lambda^3 + 2 dot lambda^2 + 2 dot lambda + 1 $

1) $C_i>0$

2) $n=4 -> Delta_(4-1)=Delta_3 $

3) $Delta_1 = 3>0; Delta_3 = 3-8 = -5 $

Система неустойчива, по 2 пункту критерия.

---

...

$ C_1 dot C_2 > C_0 dot C_3 $

== Критерий устойчивости Рауса

$ P(lambda) = C_0 dot lambda^n + C_1 dot lambda^(n-1) + ... + C_n $

$ a_1 = (C_1 dot C_2 - C_0 dot C_3)/C_1; \
  a_2 = (C_1 dot C_4 - C_0 dot C_5)/C_1; \
  a_3 = (C_1 dot C_6 - C_0 dot C_7)/C_1; \
  b_1 = (a_1 dot C_3 - C_1 dot a_2)/a_1; \
  b_2 = (a_1 dot C_5 - C_1 dot a_3)/a_1 $

Формулировка критерия устойчивости Рауса:

Для асимптотической устойчивости линейной системы необходимо и достаточно, чтобы все коэффициенты первого столбца таблицы Рауса были строго положительны. В первом столбце их должно быть n+1.


_Пример_:

$P(lambda) = 2 dot lambda^3 + 2 dot lambda^2 + 3 dot lambda + 1 $

== Структурно-неустойчивые системы

Под структурно-неустойчивой системой понимается такая система, в которой нельзя достичь устойчивости ни при каких значениях параметров. Поэтому для достижения устойчивости необходимо изменить структуру.

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

      rect(name:"у" ,(3.5,0),(5,1), stroke:red)
      rect(name:"ро",(6,0),(7.5,1))
      rect(name:"ор",(9.5,0),(10.5,1))
      rect(name:"чэ",(6,-2),(7,-3))

      content("зу","зу")
      content("у" ,$1/(T_s  lambda)$ )
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
    })
  ],
  caption: [Структурная схема структорно неустойчивой САР],
)

\

#text(fill:red)[Красным цветом] обозначен сервомотор без обратной связи.

Допустим, $nu_г=0$.

$phi,zeta_"му"$
