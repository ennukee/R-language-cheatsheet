# R cheatsheet

by Dylan Bowers (for personal usage)

To read: http://zevross.com/blog/2015/01/13/a-new-data-processing-workflow-for-r-dplyr-magrittr-tidyr-ggplot2/

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## Libraries

 * dplyr
 * ggplot2
 * tidyr
 * bigrquery (for Google BigQuery queries)

## Syntactical tips

 * You can turn most operations from `method(table, args*)` into `table %>% method(args*)`. This is useful in chaining multiple operations together, like the following:

```R
tb2 <- tb1 %>% mutate(word=tolower(word)) %>% group_by(word) %>% summarize(total = sum(word_count))
```

 * You can also use the `%>%` syntax to make multiline operations, so for the prior example (both examples are valid):

```R
tb2 <- tb1 %>% 
 mutate(word=tolower(word)) %>% 
 group_by(word) %>% 
 summarize(total = sum(word_count))
```

## Stuff you may want to know from other languages

 * **Joining together a list of strings**
  *  `paste(vector, collapse='')`
 * **Summing a list of numbers**
  * `sum(vector)`
 * **Standard deviation of a list of numbers**
  * `sd(vector)` 

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
 * Summarizing
  * `summarize(table, args*)`
  * `args` is a list of new column assignment statements. The values given to `args` will become the new columns in the table produced by this operation
  * Disclaimer: This is often used with combination statements like `sum` or `sd` (standard deviation) over numerical columns
  * For example: `summarize(table,  s=sum(num))` 
