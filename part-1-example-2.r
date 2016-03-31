# ------------------------------------------------------ #
# Concept: Utilizing groups to get effective data output #
# ------------------------------------------------------ #

import(dplyr)
import(tidyr)

# We will be setting up a multi-dimensional data.frame, so here are our column and content sets
name = c('Dylan', 'Joe', 'Chris', 'Nikolai', 'Rahaun', 'Tony')
memer = c(TRUE, FALSE, FALSE, TRUE, TRUE, FALSE) # Is a memer?
mlvl = c(102, 32, 18, 138, 167, 8) # Meme level
lpl = c(TRUE, TRUE, TRUE, TRUE, TRUE, FALSE) # League player?
salt = c(300, 9000, 200, 50, 300, 0) # Salt level

# Making the data
data = data.frame(name, memer, mlvl, lpl, salt)

print(data)

 by_memer = group_by(data, memer)
 by_lpl = group_by(data, lpl)
 
 by_memer <- summarize(by_memer, meme_count=sum(mlvl), salt_count=sum(salt))
 by_lpl <- summarize(by_lpl, meme_count=sum(mlvl), salt_count=sum(salt))
 
 print("By memer")
 print(by_memer)
 print("By lpl")
 print(by_lpl)
