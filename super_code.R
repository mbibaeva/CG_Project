df1 <- read.csv('all_data.csv', sep=';')
df1
fit <- glm(Target ~ Number+Gender+Animacy+Verb_of_speech+Ger+Verb_time+Object+Protiv1+Protiv2, data = df1, family = "binomial") 
summary(fit)

glm(formula = Target ~ Number + Gender + Animacy + Verb_of_speech + Ger + Verb_time + Object + Protiv1 + Protiv2, family = "binomial", data = df1)

#график

install.packages("corrplot")
library('corrplot')
loaddata <- read.csv('encode.csv', sep=',')
df = subset(loaddata, select = -c(X) )
corrmatr <- cor(df)
res1 <- cor.mtest(df, conf.level = .99)
corrplot(corrmatr, p.mat = res1$p, insig = "blank")


#chisq.test(loaddata$Target, loaddata$Protiv1, correct=FALSE)
