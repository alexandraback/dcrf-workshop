
weather_data <- read.csv("../data/weather.csv");
print(weather_data)
#SPLITTA I TRENINGSDATA OG
#FUNKSJONER FÖR VARJE TRÄD
#subset(my_df, subset = some_condition)

get_categorical_values <- function (data, attribute) {
  as.set(data[,attribute])
}

categorical_values_for_output_vector <- get_categorical_values(weather_data, "play")

get_number_of_occurence <- function (dataset, attribute, attribute_value) {
  nrow(subset(dataset, attribute == attribute_value))
}

##HVORDAN GØR MAN I R??
get_proportion <- function(dataset, attribute, attribute_value, output ,output_value) {
  nrow(subset(dataset, attribute == attribute_value))/nrow(subset(dataset, attribute == attribute_value & output == output_value))
}

calculate_entropy <- function(dataset, attribute) {
}

calculate_entropy(weather_data, "outlook")
