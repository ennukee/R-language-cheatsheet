# R cheatsheet

by Dylan Bowers (for personal usage)

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## Libraries

 * dplyr
 * ggplot2
 * tidyr
 * bigrquery (for Google BigQuery queries)

## Method index

 * Mutations
  *  `mutate(table, args*)`
  *  `args` is any number of `key=function` arguments
  *  For example (in a table with a column 'apps' and 'num'): `mutate(table, apps=tolower(apps), num=num*2)` 
