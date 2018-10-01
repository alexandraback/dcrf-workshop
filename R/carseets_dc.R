Carseats <- read.csv("carseats.csv");
require(tree)

set.seed(42)

train = sample(1:nrow(Carseats),nrow(Carseats)/2)
Carseats.train = Carseats[train,]
Carseats.test = Carseats[-train,]


tree = tree(Sales~.,data=Carseats.train)
summary(tree)

plot(tree)
text(tree,pretty=0)
