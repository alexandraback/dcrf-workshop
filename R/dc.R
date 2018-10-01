carseats <- read.csv("carseats.csv");

#SPLITTA I TRENINGSDATA OG
#FUNKSJONER FÖR VARJE TRÄD


calculate_entropy <- function(data, attribute, output) {
  categorical_values <- get_categorical_values(data, attribute)
  number_of_classes <- length(categorical_values)
  categorical_values_for_output <- get_categorical_values(data,output)

  for(categorical_value in categorical_values) {
    #Räkna antall förekomster för attribute_value
    count_number_of_rows_for_a_value <- nrows(dataset[ dataset$attribute == categorical_value, ])
    sum <- 0
    for(output_value in categorical_values_for_output) {
        number_of_rows_for_value_for_output_class <- nrows(dataset[ dataset$attribute == categorical_value && dataset$output == output_value , ])
        proportion <- count_number_of_rows_for_a_value/ number_of_rows_for_value_for_output_class
        sum <- sum + (-proportion *log() )
    }
  }


}

get_categorical_values <- function (dataset, attribute) {

}

calculate_information_gain <- function(dataset, attribute) {

}

general_decision_tree <- function(dataset) {
  entropy_for_data_set <- calculate_entropy(dataset)
  for (i in 0:ncol(carseats)-1) {
    entropy_for_values <- calculate_entropy_categorical_values(get_categorical_values(attribute))
    take_average_
  }
}
