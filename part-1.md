# R cheatsheet

by Dylan Bowers (for personal usage)

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## Libraries

 * dplyr
 * ggplot2
 * tidyr
 * bigrquery (for Google BigQuery queries)

## Syntactical tips

 * You can turn most operations from `method(table, args*)` into `table %>% method(args*)`. This is useful in chaining multiple operations together, like the following:

```R
tb2 <- tb1 %>% mutate(word=tolower(word) %>% group_by(word) %>% summarize(total = sum(word))
```

## Method index

 * Basic Mutations
  *  `mutate(table, args*)`
  *  `args` is any number of `key-function` re-assignment arguments
  *  For example (in a table with a column 'apps' and 'num'): `mutate(table, apps=tolower(apps), num=num*2)` 
  *  (convert all `apps` values to lowercase and double their `num` values
 * Filtrations
  * `filter(table, args*)`
  * `args` is any number of `key-function` predicate arguments
  * For example (in a table with a column 'apps' and 'num'): `mutate(table, apps==tolower(apps), num==2)`
  * (only keep rows where `apps` is all lowercase and its `num` value is 2)
 * Basic Grouping
  * `group_by(table, args*)`
  * `args` is a list of column names you want to group by (they will group if every `arg` is equal, so you can group rows by `age` and `date` if they had those columnns and it would form pseudo-groups for those with identical `age`s **and** `date`s.
  * For example: `group_by(table, apps, num)`
  * (Generate groups where `apps` and `num` are equal)
