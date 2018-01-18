# CG_Project

### Материалы
[Данные](https://github.com/mbibaeva/CG_Project/blob/master/all_data.csv)  
[Код](https://github.com/mbibaeva/CG_Project/blob/master/super_code.R)

## Рабочая гипотеза

В русском языке есть две близкие авертивные конструкции: "чуть не" и "чуть было не". Дистрибуция второй в основном сводится к глаголам (1648 вхождений из 1653), в то время как дистрибуция "чуть не" гораздо шире (с глаголом 10114 вхождений из 16043)

## Данные

### Материал исследования
Данные получены из корпуса по запросам (1) "чуть" + "не"  + V + (2) "чуть" + "быть[3SgN]" + "не" + V. Использовано по 150 размеченных примеров на каждую конструкцию.

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

### Статистически важные параметры

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
### Random Forest
