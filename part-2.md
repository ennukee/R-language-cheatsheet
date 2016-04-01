# R language cheatsheet
## Part 2 - 'Tidy'ing up your data with Tidyr

This page is heavily based off of the tidyr section of this article (feel free to read it for more info): http://zevross.com/blog/2015/01/13/a-new-data-processing-workflow-for-r-dplyr-magrittr-tidyr-ggplot2/

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## tidyr method index

### 'Spread'ing
A simple way to condense a bunch of data into a 2D array for cross-comparing.

 * **Usage**: `spread(data, key, value, fill = NA)`
 * **Params**
  * `data` is the table you want to spread
  * `key` is the name of the columns
  * `value` are the values that fill the 2D table
  * `fill` (optional) replace empty values (default `NA`) with some value

For example: if you had the table

|name|word|word_count|
|---|---|---|
|Dank|a|1|
|Dank|b|5|
|Dank|d|3|
|Memes|a|2|
|Memes|b|5|
|Memes|c|1|
|Lol|a|3|
|Lol|b|6|
|Lol|c|3|

and you applied `spread(table, word, word_count)`, you'd get:

|name|a|b|c|d|
|---|---|---|---|---|
|Dank|1|5|NA|3|
|Memes|2|5|1|NA|
|Lol|3|6|3|NA|

**Note**: Will still require indices to reference. You cannot refer to rows by the remaining columns. 

**Also note**: The columns that remain on the left will be any of the columns you do not touch in the function (i.e. all but `key` and `value`).
