# ---------------------------------------------- #
# Concept: Working with summarization operations #
# ---------------------------------------------- #

# You should be capable of writing this code on your own before the competition

library(dplyr)

tbl1 = c(1, 2, 3, 4, 1, 2, 4, 3, 2, 3, 1, 2, 3)
tbl1.freq = table(tbl1) # NOTE: *.freq is not a syntactic rule, it can be anything. The key is table(TABLE_NAME)

# Observe this result
print(tbl1.freq) 

# Import data to a data.frame for dplyr operations (note the column names)
dta1 = data.frame(tbl1.freq) 
print(dta1)

# Apply basic summarizaton operations
dta1 <- dta1 %>% summarize(sum=sum(Freq), standard_dev=sd(Freq), average=mean(Freq))

# Observe the result of the prior operations
print(dta1)
