# CG_Project

### Материалы
[Данные](https://github.com/mbibaeva/CG_Project/blob/master/all_data.csv)  
[Код](https://github.com/mbibaeva/CG_Project/blob/master/super_code.R)

## Рабочая гипотеза

В русском языке есть две близкие авертивные конструкции: "чуть не" и "чуть было не". Дистрибуция второй в основном сводится к глаголам (1648 вхождений из 1653), в то время как дистрибуция "чуть не" гораздо шире (с глаголом 10114 вхождений из 16043)

## Данные

### Материал исследования
Данные получены из корпуса НКРЯ по запросам (1) "чуть" + "не"  + V + (2) "чуть" + "быть[3SgN]" + "не" + V. Использовано по 150 размеченных примеров на каждую конструкцию.

### Гипотеза
"чуть не" является исходной и более "базовой" конструкцией, в то время как у "чуть было не" больше развилось авертивное значение, из-за чего с ней могут чаще употребляться другие классы глаголов; также похоже, что авертивность может требовать противительности рядом с собой, поэтому выбраны следующие параметры:

- Subject: подлежащее
- Number: число (глагола)
- Gender: род (глагола и подлежащего)
- Animacy: одушевлённое (1) ли подлежащее или нет (0); непонятные случаи размечены как (2). Также случаи, когда подлежащее выражено местоимением, но из контекста понятно, что оно одушевлённое, размечены как (1).
- Verb: какой именно глагол
- Verb_of_speech: относится ли глагол к классу глаголов речи
- Ger: глагол/причастие/деепричастие
- Verb_time: время глагола
- Object: есть ли дополнения (0/прямые/косвенные)
- Protiv1: противительный союз в клаузе, следующей после клаузы с конструкцией
- Protiv2: противительный союз в клауе, содержащей конструкцию

## Анализ: дескриптивная статистика
 
### Summary
```
Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.4315  -1.0445   0.1633   0.9885   1.9108  

Coefficients: (1 not defined because of singularities)
                  Estimate Std. Error z value Pr(>|z|)    
(Intercept)     -2.958e+01  1.730e+03  -0.017  0.98636    
NumberPl        -2.545e+00  2.058e+03  -0.001  0.99901    
NumberSg         1.333e+01  2.521e+03   0.005  0.99578    
GenderF         -5.089e-09  2.058e+03   0.000  1.00000    
GenderM          1.503e-01  2.058e+03   0.000  0.99994    
GenderN          4.871e-01  2.058e+03   0.000  0.99981    
GenderPl         1.577e+01  1.455e+03   0.011  0.99135      
Animacy          1.231e+00  3.821e-01   3.223  0.00127 ** 
Verb_of_speech0  1.598e+01  9.355e+02   0.017  0.98638    
Verb_of_speech1  1.524e+01  9.355e+02   0.016  0.98700    
Ger             -2.266e-01  3.640e-01  -0.622  0.53371    
Verb_timePres    1.792e+00  1.204e+00   1.488  0.13678    
Object          -6.484e-01  1.607e-01  -4.036 5.45e-05 ***
Protiv1         -9.555e-01  4.186e-01  -2.283  0.02245 *  
Protiv2         -6.649e-01  4.390e-01  -1.515  0.12984    
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 415.89  on 299  degrees of freedom
Residual deviance: 360.72  on 285  degrees of freedom
AIC: 390.72

Number of Fisher Scoring iterations: 14
```

### Корреляция

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/Rplot.png)

[Матрица корреляций](https://github.com/mbibaeva/CG_Project/blob/master/encode.csv)

[Код для матрицы корреляций](https://github.com/mbibaeva/CG_Project/blob/master/code_to_encode.py)

### Число подлежащего

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/number.png)

### Род подлежащего

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/gender.png)
### Одушевлённость подлежащего: значима

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/animacy.png)

- 0 - неодушевлённость
- 1 - одушевлённость
- 2 - спорные случаи (например, обозначения больших группу людей)
### Наличие и тип дополнения: значимы

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/object.png)

- 0 - дополнения нет
- 1 - прямое дополнение
- 2 - косвенное дополнение
- 3 - странные и непрямые значения

### Глагол речи

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/verb_of_speech.png)
### Время глагола 

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/tense.png)

Вообще нет будущего времени, что понятно.

### Форма глагола

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/gerund.png)

- 1 - причастие
- 2 - деепричастие
### Противительный союз в следующей клаузе: значим

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/protiv1.png)
### Противительный союз в клаузе с конструкцией

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/protiv2.png)

## Мультифакторный анализ

### Random Forest
```
                чуть было    чуть не MeanDecreaseAccuracy MeanDecreaseGini
Number          0.9878046  1.6466722             2.460525         1.984588
Gender         -2.0754550  4.4842089             1.488494         7.102832
Animacy        27.5475716 32.5204358            39.054930        16.574628
Verb_of_speech 10.1258536 -5.6673702             2.949792         3.244308
Ger             4.1094017  9.0531065             9.111413         4.024639
Verb_time       5.9091805 -0.9130392             2.856975         1.572379
Object         17.9039930 20.7726678            24.089646        17.576813
Protiv1         8.3857913  3.2124060             7.964009         3.830399
Protiv2         3.3317542  3.0655593             4.555287         3.603058
```
![alt text](https://github.com/mbibaeva/CG_Project/blob/master/randomforestforALL.png)

Не совсем понимаю, каким образом и почему среди более значимых параметров оказался род.

### Дерево

![alt text](https://github.com/mbibaeva/CG_Project/blob/master/tree1.png)

### Статистически важные параметры

* с родом
```
Call:
glm(formula = Target ~ Animacy + Gender + Object + Protiv1, family = "binomial", 
    data = df1)

Deviance Residuals: 
     Min        1Q    Median        3Q       Max  
-2.11797  -1.04181   0.05768   1.05261   1.95127  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept) -0.48538    0.40130  -1.210  0.22646    
Animacy      1.20134    0.37388   3.213  0.00131 ** 
GenderM      0.21339    0.32277   0.661  0.50854    
GenderN      0.49874    0.67545   0.738  0.46029    
GenderNone  -0.06009    0.39250  -0.153  0.87832    
Object      -0.62850    0.15693  -4.005  6.2e-05 ***
Protiv1     -0.97079    0.40650  -2.388  0.01693 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 415.89  on 299  degrees of freedom
Residual deviance: 375.22  on 293  degrees of freedom
AIC: 389.22

Number of Fisher Scoring iterations: 4
```

* без рода
```
Call:
glm(formula = Target ~ Animacy + Object + Protiv1, family = "binomial", 
    data = df1)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.0605  -1.0473   0.0604   1.0906   1.8801  

Coefficients:
            Estimate Std. Error z value Pr(>|z|)    
(Intercept)  -0.3141     0.3339  -0.941 0.346846    
Animacy       1.1547     0.3201   3.607 0.000309 ***
Object       -0.6330     0.1557  -4.064 4.82e-05 ***
Protiv1      -0.9895     0.4043  -2.447 0.014394 *  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 415.89  on 299  degrees of freedom
Residual deviance: 376.54  on 296  degrees of freedom
AIC: 384.54

Number of Fisher Scoring iterations: 4
```
* без значимых параметров
```
Call:
glm(formula = Target ~ Number + Gender + Verb_of_speech + Ger + 
    Verb_time + Protiv2, family = "binomial", data = df1)

Deviance Residuals: 
    Min       1Q   Median       3Q      Max  
-2.2798  -1.0893  -0.1923   1.0329   1.5657  

Coefficients:
               Estimate Std. Error z value Pr(>|z|)  
(Intercept)     -0.4325     1.4677  -0.295   0.7682  
NumberSg         0.1925     1.4719   0.131   0.8960  
GenderM          0.5899     0.2954   1.997   0.0459 *
GenderN         -0.1629     0.6188  -0.263   0.7923  
GenderNone       0.4457     1.4748   0.302   0.7625  
Verb_of_speech  -0.5608     0.3675  -1.526   0.1270  
Ger             -0.2122     0.3467  -0.612   0.5405  
Verb_timePres    2.1715     1.1774   1.844   0.0651 .
Protiv2         -0.6382     0.4089  -1.561   0.1186  
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1

(Dispersion parameter for binomial family taken to be 1)

    Null deviance: 415.89  on 299  degrees of freedom
Residual deviance: 400.51  on 291  degrees of freedom
AIC: 418.51

Number of Fisher Scoring iterations: 4
```
## Результат

C учётом  данных из работы 
[А.Козлова](https://www.academia.edu/19745939/%D0%9E_%D0%BC%D0%B5%D1%85%D0%B0%D0%BD%D0%B8%D0%B7%D0%BC%D0%B5_%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B0%D1%82%D0%B8%D0%BA%D0%B0%D0%BB%D0%B8%D0%B7%D0%B0%D1%86%D0%B8%D0%B8_%D0%BA%D0%BE%D0%BD%D1%81%D1%82%D1%80%D1%83%D0%BA%D1%86%D0%B8%D0%B8_%D1%87%D1%83%D1%82%D1%8C_%D0%B1%D1%8B%D0%BB%D0%BE_%D0%BD%D0%B5), где утверждается, в частности, что конструкция "чуть не" употребляется в целом лучше с гиперболами (например "я чуть не залез на стенку" vs ?"я чуть было не залез на стенку"), можно заключить, что авертивное "чуть было не" не просто более авертивно, но и, поскольку ближе к более реальным событиям, чаще требует одушевлённого субъекта.

Противительный союз в следующей клаузе может быть следствием того, что "чуть было не" должен находиться при глаголе в фокусе, в то время как для "чуть не" это менее важно.
 
