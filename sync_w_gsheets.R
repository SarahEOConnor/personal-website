library(tidyverse)
library(googlesheets4)
gs4_deauth()

sheets <- c("featured_work", 
            "projects", 
            "cv_entries", 
            "publications")

store_sheet_in_csv <- function(sheet_name){
  read_sheet("https://docs.google.com/spreadsheets/d/1GzYI4p-VgsM7OiYu4HeVhKFWfJvL3KokGT8DzeCHrlI/edit?usp=sharing",
             sheet = sheet_name, col_types = c("c")) %>% 
    write_csv(here::here(str_c("data/", sheet_name, ".csv")))
}

walk(sheets, store_sheet_in_csv)


