#install.packages("tree",repos = "https://CRAN.R-project.org/")
library(tree)

weather_data <- read.csv("../data/weather.csv");
attribute_names <- names(weather_data)

print(str(weather_data))

#SPLIT DATASET INTO TRAIN SET AND TEST SET
#set.seed(101) <- før att replikera sample
train = sample(1:nrow(weather_data),10)

weather_data.train = weather_data[train,]
weather_data.test = weather_data[-train,]

#TRÆNA TRÆDET
tree.weather = tree(play~.,data=weather_data, subset=train)

summary(tree.weather)
plot(tree.weather)
text(tree.weather,pretty=0)


#PREDIKTERA
tree.pred = predict(tree.weather, weather_data.test, type="class")

#SUM THE DIAGONALS / NUMBER OF DATA_ENTRIES TO GET ERROR
with(weather_data.test, table(tree.pred, play))
