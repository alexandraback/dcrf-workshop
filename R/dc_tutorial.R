#install.packages("tree",repos = "https://CRAN.R-project.org/")
library(tree)

weather_data <- read.csv("weather.csv");
attribute_names <- names(weather_data)

print(str(weather_data))

#Print attribute names
print(attribute_names)

#Print dimensions of dataset
print(dim(weather_data))

#SPLIT DATASET INTO TRAIN SET AND TEST SET
#set.seed(101)
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
