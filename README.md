# reverse-geolocate-r
A simple function to reverse geolocate latitude and longitude in R and get a dataframe with City, Location, State and Country.

# About

So, I needed to clean a dataset's city column but it had all sorts of random values and formats and cleaning a large dataset is a problem. I was lucky though that the set has latitudes and longitudes. I decided to reverse geolocate them using the Google Maps API and ggmap.

Then, turned it into a function for general use.
Please make sure you get an API key from https://developers.google.com/maps/documentation/javascript/get-api-key

You should pass the API Key string along with the function arguments of latitude and longitude. You can modify the columns, if you require some other info from the result of the API call. 

Also, you may be charged for using the Google API after a certain number of queries. Please check the pricing details of Google Maps API from the link above.

