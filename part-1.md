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
  *  `mutate(tab;e. args*)`
  *  `args` is any number of `key=function` pairs
  *  For example (in a table with a column 'apps'): `mutate(table, apps=tolower(apps))` 
