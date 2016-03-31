# ---------------------------------------------------- #
# Concept: Advanced multi-level usage of dplyr methods #
# ---------------------------------------------------- #

library(dplyr)

author = c('John Smith', 'Dans Game', 'Kappa Ross', 'Alma Mater', 'Fak Yu', 'Alma Mater', 'Fak Yu', 'John Smith', 'Dans Game', 'Kappa Ross', 'Alma Mater', 'Fak Yu')
book = c('A 1', 'A 2', 'A 3', 'A 4', 'MyMom', 'Kappa', 'Lmaowtf', 'I WAS IN ALPHA', 'Saiko', 'Goddamnitchris', 'B 1', 'B 2')
year = c(2015, 2015, 2016, 2016, 2017, 2015, 2016, 2014, 2015, 2016, 2015, 2015)
sold = c(1, 50, 60, 45, 55, 70, 2, 34, 64, 43, 23, 130)
rating = c(2.3, 5, 5.2, 5, 5.1, 6, 2.1, 4, 6, 7, 4, 9)

data = data.frame(author, book, year, sold, rating)

data_set_1 = data %>%
  group_by(author) %>%
  summarize(average_rating=mean(rating), average_sold=mean(sold))

print(data_set_1)
