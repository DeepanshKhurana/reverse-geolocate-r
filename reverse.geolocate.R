# This function uses the Google Geocoding API to convert latitude and longitude values to a dataframe with the details about that place.
# I've used this function for output of places in India. You might have to modify it a bit, see the line "columns <- c(15:18)".
#
# I recommend doing a proof-of-concept on the head of your data before you actually use it for the entire dataset.
# I also recommend dividing the dataset into subsets as that will help you get results quicker.
#
#
# @dependency ggmap for the geocode function
# @dependency plyr for ldply
#
#
# @param lat - The latitude value or column using $ notation
# @param long - The longitude value or column using $ notation
# @param api.key - Your Google Geocoding API key.
# You'll need to get one here: https://developers.google.com/maps/documentation/geocoding/start
# The Geocoding API requires you to sign up with payment details. You may get charged for using it in huge volumes. 
# Please refer to the official documentation provided by Google on their pages.
#
#
# @return dataframe with four columns namely, CITY, STATE, COUNTRY, PINCODE
#
reverse.geolocate <- function(lat, long, api.key) {
  require(ggmap)
  require(plyr)
  register_google(key = api.key)
  result <- lapply(paste(lat, long, sep = ","), geocode, output = "more")
  columns <- c(15:18)
  geo.data <- (ldply(result, data.frame))[, columns]
  colnames(geo.data) <- c("CITY", "STATE", "COUNTRY", "PINCODE")
  return(geo.data)
}

