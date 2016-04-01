# R cheatsheet
## Part 1 - basic dplyr usage

by Dylan Bowers (for personal usage)

This page is heavily based off of the `dplyr` section of this article (feel free to read it for more info): http://zevross.com/blog/2015/01/13/a-new-data-processing-workflow-for-r-dplyr-magrittr-tidyr-ggplot2/

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## Syntactical tips

 * You can turn most operations from `method(table, args*)` into `table %>% method(args*)`. This is useful in chaining multiple operations together, like the following:

```R
tb2 <- tb1 %>% mutate(word=tolower(word)) %>% group_by(word) %>% summarize(total = sum(word_count))
```

 * You can also use the `%>%` syntax (known as 'piping' introduced in `magrittr` which is a library build into `dplyr`) to make multiline operations, so for the prior example (both examples are valid):

<details>
<summary>Code example></summary>
```R
tb2 <- tb1 %>%
 mutate(word=tolower(word)) %>%
 group_by(word) %>%
 summarize(total = sum(word_count))
```
</details>

You can also use the `%<>%` operation to simplify this further if you are assigning to the same table you're operating on, so for example:

<details>
<summary>Code example</summary>
```R
tb1 <- filter(tb1, word=='henry')
# OR
tb1 <- tb1 %>% filter(word=='henry')

# Can be rewritten as this
tb1 %<>% filter(word=='henry')
```
</details>

## Stuff you may want to know from other languages

 * **Joining together a list of strings**
  *  `paste(vector, collapse=char)`
   * So to join `c(1,2,3)` to `123` is `paste(c(1,2,3), collapse='')`
   * Or perhaps a CSV? `paste(c('a', 'c', 'e'), collapse=', ')`
 * **Summing a list of numbers**
  * `sum(vector)`
 * **Standard deviation of a list of numbers**
  * `sd(vector)`
 * **Measuring the length of a string**
  * `nchar(character)` (note: you can feed something like `nchar(col)>5` into a `filter` call)\
 * **Checking if a string is in a vector**
  * `char_variable%in%vector` 
 * **Subset-ing a vector**
  * `vector[start:end]`
  * Note: This is inclusive, it will include the start and end indices in the result
  * Also remember the first index in a vector is **1**.

## Basic dplyr method index

### Sorting 
Sorts data based on a column
 * **Usage**: `arrange(table, args*)`
 * **Params**
  * `args` is any number of methods of columns to sort by. Each column defaults to ascending order (low to high). To specify descending order, do `desc(column)` instead. Will prioritize the earlier columns you put in the list.

For example: `tbl %<>% arrange(desc(num))` will sort with the rows that contain the highest value of `num` at the top.

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

### Ignoring columns
Used to return the same table with a column removed
 * **Usage**: `select(table, column)`
 * **Params**
  * `column` is the column to remove 

