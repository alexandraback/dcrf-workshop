import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from sklearn.metrics import accuracy_score

weather_data = pd.read_csv("weather.csv")

#one hot encoding
#weather_data = pd.get_dummies(weather_data, columns=["play", "outlook", "temp", "humidity"])
print(weather_data)

#Label encoding
weather_data["play"] = weather_data["play"].astype('category')
weather_data["outlook"] = weather_data["outlook"].astype('category')
weather_data["temp"] = weather_data["temp"].astype('category')
weather_data["humidity"] = weather_data["humidity"].astype('category')
weather_data["humidity"] = weather_data["humidity"].cat.codes
weather_data["temp"] = weather_data["temp"].cat.codes
weather_data["outlook"] = weather_data["outlook"].cat.codes
weather_data["play"] = weather_data["play"].cat.codes

X = weather_data.drop('play', axis=1)
output = weather_data['play']

from sklearn.model_selection import train_test_split
X_train, X_test, output_train, output_test = train_test_split(X, output, test_size=0.20)

from sklearn.tree import DecisionTreeClassifier
classifier = DecisionTreeClassifier()
dtree = classifier.fit(X_train, output_train)

output_pred = classifier.predict(X_test)

print ("Accuracy is ", accuracy_score(output_test,output_pred)*100)

from sklearn.externals.six import StringIO
from IPython.display import Image
from sklearn.tree import export_graphviz
import pydotplus

dot_data = StringIO()
export_graphviz(dtree, out_file=dot_data,
                filled=True, rounded=True,
                special_characters=True)
graph = pydotplus.graph_from_dot_data(dot_data.getvalue())
print (graph)
Image(graph.create_png())
