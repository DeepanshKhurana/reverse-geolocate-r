get.city.df <- function(lat, long, api.key) {
  require(ggmap)
  require(plyr)
  register_google(key = api.key)
  result <- lapply(paste(lat, long, sep = ","), geocode, output = "more")
  columns <- c(15:18)
  geo.data <- (ldply(result, data.frame))[, columns]
  colnames(geo.data) <- c("CITY", "LOCATION", "STATE", "COUNTRY")
  return(geo.data)
}

