#get data
df1 <- read.csv('D:/НИУ_ВШЭ/Грамматика_конструкций/Project/all_data.csv', sep=';')
df1

fit <- glm(Target ~ Number+Gender+Animacy+Verb_of_speech+Ger+Verb_time+Object+Protiv1+Protiv2, data = df1, family = "binomial") 
summary(fit)

#create correlation matrix
loaddata <- read.csv('D:/НИУ_ВШЭ/Грамматика_конструкций/Project/encode.csv', sep=',') #encode.csv created with python
library('corrplot', lib="D:/corrplot") #package corrplot
df = subset(loaddata, select = -c(X) )
corrmatr <- cor(df)
res1 <- cor.mtest(df, conf.level = .99)
corrplot(corrmatr, p.mat = res1$p, insig = "blank")

# summary for significant parameters
sign_param <- glm( Target ~ Animacy+Object+Protiv1 , data = df1, family="binomial")
summary(sign_param)

sign_param1 <- glm( Target ~ Animacy+Gender+Object+Protiv1 , data = df1, family="binomial")
summary(sign_param1)

#random forest
install.packages("randomForest", lib="D:/RandomForest")
library("randomForest", lib="D:/RandomForest")
require(randomForest)
fit_forest <- randomForest(Target ~ Number+Gender+Animacy+Verb_of_speech+Ger+Verb_time+Object+Protiv1+Protiv2, data=df1, importance = TRUE)
importance(fit_forest)
varImpPlot(fit_forest, type=2) #plot MeanDecreaseGini

# tree
library(caTools, lib="D:/caTools")
set.seed(3000)
split <- sample.split(df$Target, SplitRatio = 0.7)
Train <- subset(df, split == TRUE)
Test <- subset(df, split == FALSE)

library(rpart, lib="D:/rpart")
library(rpart.plot, lib="D:/rpart")

Tree <- rpart(Target ~ Animacy+Gender+Object+Protiv1,
              data = Train, method = "class",
              control=rpart.control(minbucket = 25))
prp(Tree)

# prediction
PredictCART <- predict(Tree, newdata = Test, type="class")

# accuracy
table(Test$Target, PredictCART)

# summary without significant parameters
fit2 <- glm(Target ~ Number+Gender+Verb_of_speech+Ger+Verb_time+Protiv2, data = df1, family = "binomial") 
summary(fit2)


#visualize
library(ggplot2)
library(magrittr)
table(df1$Animacy, df$Target)
dt <- as.data.frame(table(df1$Animacy, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Verb_of_speech, df$Target)
dt <- as.data.frame(table(df1$Verb_of_speech, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Object, df$Target)
dt <- as.data.frame(table(df1$Object, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Protiv1, df$Target)
dt <- as.data.frame(table(df1$Protiv1, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Protiv2, df$Target)
dt <- as.data.frame(table(df1$Protiv2, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Number, df$Target)
dt <- as.data.frame(table(df1$Number, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Gender, df$Target)
dt <- as.data.frame(table(df1$Gender, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Verb_time, df$Target)
dt <- as.data.frame(table(df1$Verb_time, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)

table(df1$Ger, df$Target)
dt <- as.data.frame(table(df1$Ger, df1$Target))
dt
dt %>% 
  ggplot(aes(x=Var1, y=Freq, fill=Var2)) + 
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(label = Freq, Freq = Freq + 0.1), position = position_dodge(0.9), vjust = 0)


