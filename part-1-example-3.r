# ---------------------------------------------------- #
# Concept: Advanced multi-level usage of dplyr methods #
# ---------------------------------------------------- #

# -------------------------- NOTE -------------------------- #
# Due to the sheer amount of data parsing here, if you want  #
# to view any of the results (i.e. data_set_1), you can type #
# the variable name (i.e. data_set_1) into the console after #
# you compile the script!                                    #
# ---------------------------------------------------------- #

library(dplyr)

author = c('John Smith', 'Dans Game', 'Kappa Ross', 'Alma Mater', 'Fak Yu', 'Alma Mater', 'Fak Yu', 'John Smith', 'Dans Game', 'Kappa Ross', 'Alma Mater', 'Fak Yu')
book = c('A 1', 'A 2', 'A 3', 'A 4', 'MyMom', 'Kappa', 'Lmaowtf', 'I WAS IN ALPHA', 'Saiko', 'Goddamnitchris', 'B 1', 'B 2')
year = c(2015, 2015, 2016, 2016, 2017, 2015, 2016, 2014, 2015, 2016, 2015, 2015)
sold = c(1, 50, 60, 45, 55, 70, 2, 34, 64, 43, 23, 130)
rating = c(2.3, 5, 5.2, 5, 5.1, 6, 2.1, 4, 6, 7, 4, 9)

data = data.frame(author, book, year, sold, rating)

# Calculate each author's average rating and average sold (as an int), 
# then sort it by their ratings
data_set_1 = data %>%
  group_by(author) %>%
  summarize(average_rating=mean(rating), average_sold=mean(sold)) %>%
  mutate(average_sold=as.integer(average_sold)) %>%
  arrange(desc(average_rating))

# Calculate each author's best and worst rating
data_set_2 = data %>%
  group_by(author) %>%
  summarize(best_rating=max(rating), worst_rating=min(rating))

# In a given year, calculate the number of books released, 
# the number of books sold, the average books sold, and
# the average rating of the books
data_set_3 = data %>%
  group_by(year) %>%
  summarize(num_books=n(), books_sold=sum(sold), avg_books_sold=mean(sold), average_rating=mean(rating))

# In a given year, calculate an author's number of released,
# books sold, and average rating of those books
data_set_4 = data %>%
  group_by(author, year) %>%
  summarize(num_books=n(), books_sold=sum(sold), avg_rating=mean(rating))

# Find authors who have a total book sold count of over 100
# and an average rating of more then 5 (ELITE WRITERS!11!!)
data_set_5 = data %>%
  group_by(author) %>%
  summarize(books_sold=sum(sold), avg_rating=mean(rating)) %>%
  filter(books_sold>100, avg_rating>5)
