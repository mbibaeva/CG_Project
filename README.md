# CG_Project

### Материалы
[Данные](https://github.com/mbibaeva/CG_Project/blob/master/all_data.csv)  
[Код](https://github.com/mbibaeva/CG_Project/blob/master/super_code.R)

## Рабочая гипотеза

В русском языке есть две близкие авертивные конструкции: "чуть не" и "чуть было не". Дистрибуция второй в основном сводится к глаголам (1648 вхождений из 1653), в то время как дистрибуция "чуть не" гораздо шире (с глаголом 10114 вхождений из 16043)

## Данные

### Материал исследования
Данные получены из корпуса по запросам (1) "чуть" + "не"  + V + (2) "чуть" + "быть[3SgN]" + "не" + V. Использовано по 100 размеченных примеров на каждую конструкцию.

### Гипотеза
"чуть не" является исходной и более "базовой" конструкцией, в то время как у "чуть было не" больше развилось авертивное значение, из-за чего с ней могут чаще употребляться другие классы глаголов; также похоже, что авертивность может требовать противительности рядом с собой, поэтому выбраны следующие параметры:

- Subject: подлежащее
- Number: число (глагола)
- Gender: род (глагола и подлежащего)
- Animacy: одушевлённое ли подлежащее
- Verb: какой именно глагол
- Verb_of_speech: относится ли глагол к классу глаголов речи
- Ger: глагол/причастие/деепричастие
- Verb_time: время глагола
- Object: есть ли дополнения (0/прямые/косвенные)
- Protiv1: противительный союз в клаузе, следующей после клаузы с конструкцией
- Protiv2: противительный союз в клауе, содержащей конструкцию

## Анализ: дескриптивная статистика

[Корреляция](https://github.com/mbibaeva/CG_Project/blob/master/Rplot.pdf)

```
Call:
glm(formula = Target ~ Number + Gender + Animacy + Verb_of_speech + 
    Ger + Verb_time + Object + Protiv1 + Protiv2, family = "binomial", 
    data = df1)

Deviance Residuals: 
   Min      1Q  Median      3Q     Max  
-1.177  -1.177   0.000   1.177   1.177  

Coefficients: (1 not defined because of singularities)
                  Estimate Std. Error z value Pr(>|z|)
(Intercept)      4.907e-14  1.937e+00       0        1
NumberPl        -4.997e-14  2.117e+00       0        1
NumberSg        -4.580e-14  2.599e+00       0        1
GenderF          2.073e-14  2.087e+00       0        1
GenderM          1.707e-14  2.127e+00       0        1
GenderN          2.016e-14  2.199e+00       0        1
GenderPl         2.198e-14  1.475e+00       0        1
GenderPL                NA         NA      NA       NA
Animacy0        -8.571e-15  6.660e-01       0        1
Animacy1        -4.846e-15  5.955e-01       0        1
Verb_of_speech0 -1.550e-14  1.043e+00       0        1
Verb_of_speech1 -1.577e-14  1.103e+00       0        1
Ger             -1.355e-17  3.983e-01       0        1
Verb_timePres   -2.895e-16  1.452e+00       0        1
Object          -2.221e-16  1.640e-01       0        1
Protiv1         -1.092e-15  4.081e-01       0        1
Protiv2         -1.951e-15  4.882e-01       0        1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 277.26  on 199  degrees of freedom
Residual deviance: 277.26  on 184  degrees of freedom
AIC: 309.26

Number of Fisher Scoring iterations: 2
```
