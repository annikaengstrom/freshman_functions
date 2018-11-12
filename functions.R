library(tidyverse)

get_filename <- function(race) {
  race <- str_to_lower(race)
  paste0("https://raw.githubusercontent.com/TheUpshot/2018-live-poll-results/master/data/elections-poll-", race, ".csv")
}

get_tibble <- function(path) {
  download.file(url = path,
                destfile = "temp.csv",
                quiet = TRUE,
                mode = "wb")
  raw <- read_csv("temp.csv")
  file.remove("temp.csv")
  raw
}

path <- get_filename("ca49-1") 

get_tibble(path)
