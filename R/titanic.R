library(tree)

Titanic <- read.csv("../data/titanic.csv");

hist(Titanic$Pclass)
hist(Titanic$Fare)

HighPrice = ifelse(Titanic$Fare<=30, "No", "Yes")

set.seed(14)
train = sample(1:nrow(Titanic),nrow(Titanic)/2)
Titanic.train = Titanic[train,]
Titanic.test = Titanic[-train,]
