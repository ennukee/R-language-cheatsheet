# R cheatsheet
## Part 1 - elementary syntax and basic dplyr usage

by Dylan Bowers (for personal usage)

To read: http://zevross.com/blog/2015/01/13/a-new-data-processing-workflow-for-r-dplyr-magrittr-tidyr-ggplot2/

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## Generating a table (custom values, not from a file/SQL)

```R
tbl <- data.frame(col1 = c(1,2,4,3), col2 = c('a','c','d','e'))
tbl
```
The result (note that the far left column is a sort of `id` column:

||col1|col2|
|---|---|---|
|*1*|1|'a'|
|*2*|2|'c'|
|*3*|4|'d'|
|*4*|3|'e'|

Take note that the variable names for the vectors become the actual column names (plan ahead!)

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

## Basic dplyr method index

### Basic Mutations
Modifications to a table (i.e. multiply everything by 5, etc
  *  **Usage**: `mutate(table, args*)`
  *  **Params** 
   *  `args` is any number of `key-function` re-assignment arguments

For example (in a table with a column 'apps' and 'num'): `mutate(table, apps=tolower(apps), num=num*2)` (convert all `apps` values to lowercase and double their `num` values

### Filtrations
Not much to say about this, very straight forward
  * **Usage**: `filter(table, args*)`
  * **Params**
   * `args` is any number of `key-function` predicate arguments

For example (in a table with a column 'apps' and 'num'): `mutate(table, apps==tolower(apps), num==2)` (only keep rows where `apps` is all lowercase and its `num` value is 2)

### Basic Grouping
Used to generate sub-groups to then be iterated on by another operation (i.e. if you group by `word` then `summarize` on `total = sum(word_count)` right after, it will maintain the `word` column)
  * **Usage**: `group_by(table, args*)`
  * **Params** 
   * `args` is a list of column names you want to group by (they will group if every `arg` is equal, so you can group rows by `age` and `date` if they had those columnns and it would form pseudo-groups for those with identical `age`s **and** `date`s.

For example: `group_by(table, apps, num)` (Generate groups where `apps` and `num` are equal)
 
### Summarizing
Used for literally **summarizing** a table.
  * **Usage**: `summarize(table, args*)`
  * **Params** 
   * `args` is a list of new column assignment statements. The values given to `args` will become the new columns in the table produced by this operation

Disclaimer: This is often used with combination statements like `sum` or `sd` (standard deviation) over numerical columns

For example: `summarize(table,  s=sum(num))` 
