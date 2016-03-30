# Absolutely Basics of R

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## Installing packages

```R
install.packages()
# ( you will be prompted to select a mirror to download from once per session )
# ( then you will be prompted for to select a package )
```

You should also be able to do this:

```R
install.packages('package_name')
```

So you should do this first before anything else:

```R
install.packages('dplyr')
install.packages('tidyr')
install.packages('ggplot2')
```

## Importing packages

```R
library(package_name)

# So, you'll want this at the top of your scripts:
library(dplyr)
library(tidyr)
library(ggplot2)
```

## Fundamental basics

Read this: http://www.r-tutor.com/r-introduction. It contains almost **every** basic programming methodlogy you may think of googling from other languages (like making arrays, length of str/array, etc). You can just skim and look at code bits if it's too long to read fully.

You should be familiar with the syntax: `c(args*)` (used **very** often), `is.class_name(object)`, `sprintf(str, args*)`, `substr(str, start=int, stop=int)`, `sub(to_replace, replace_with, str)`, `paste(str, str)`, `class(object)`. Most of these will be very straight forward and won't need any real reading on your part, just know they exist and they're usage syntax.

Note: R treats the class `character` the same as `string`. So `is.character('abc')` will yield `TRUE`.

<details>
<summary>Conditionals:</summary>

|Symbol|Meaning|
|---|---|
|`|`|OR|
|`&`|AND|
|`!`|NOT|

</details>

### Vector logic

In R, the objects known as **Vectors** are basically just arrays from any other language in existence. **VERY IMPORTANT NOTE: Indices in R start at ONE, NOT ZERO!**

You can generate them using the syntax `c(args*)` which makes an array with contents `args*` so for example: `c(1,2,3)` = `[1, 2, 3]`. You can also use the `c(args*)` method to concatenate two vectors together, so `c(c(1,2,3), c(3,4,5))` = `[1, 2, 3, 3, 4, 5]`.

I **highly recommend** viewing the Vector portion of the guide I posted above. It will be extremely helpful in understanding how vector logic works. For example: adding (using `+`) two vectors together will not concatenate them, it will add the contents together. So `c(1,2,3) + c(3,4,5)` = `[4, 6, 8]`. Multiplying a vector will multiply its contents.

An important rule is known as the **recycling rule**. Operating on two vectors of different length will extend the shorter vector using its own values again. For example: `c(1,2,3) + c(3,4,5,6,7,8,9)` is essentially doing `c(1,2,3,1,2,3,1) + c(3,4,5,6,7,8,9)`.

<details>
<summary>**Nifty trick**: What will `c(1, -1) * c(1, 2, 4, 8, 16, 32)` create?</summary>
`[1, -2, 4, -8, 16, -32]`
aka an alternating sequence!
</details>

**Be careful with negative indices**. Unlike other languages, negative indices will **not** search from the back of an array. So `array[-1]` will not return the last value of an array. Negative indices will instead return the vector with the item at the absolute value of the index removed. 

<details>
<summary>Code example</summary>
```R
> a = c(1, 2, 3, 4)
> a
[1, 2, 3, 4]
> a[-1]
[2, 3, 4]
> a[-3]
[1, 2, 4]
```
</details>

### Matrices

In **R**, there are data types known as **Matrices**. They're a more convenient way of representing 2-dimensional arrays. You can supply a large feed of values and then specify specific column and row values to restrict it. You can then refer to it like a normal 2D array (i.e. `(c[x, y])`).

It is done using the `matrix(data_vector, nrow=int, ncol=int, byrow=TRUE)` method.

<details>
<summary>Code example</summary>
```R
A = matrix(
  c(1, 2, 3, 4, 5, 6),
  nrow=2,
  ncol=3,
  byrow=TRUE)
```

Generates the following table:

```
1 2 3
4 5 6
```
</details>

We can supply the matrix/table with labels using `rownames(matrix)`, `colnames(matrix)`, or `dimnames(matrix)`. The first and second take in a single vector as their equality (you call these using `method = val`, not using another param) while the third takes in a list of column names and row names.

<details>
<summary>Code example</summary>
```R
dimnames(A) = list(
            c('row1', 'row2'),
            c('col1', 'col2', 'col3'))
```

This produces:

||col1|col2|col3|
|---|---|---|---|
|**row1**|1|2|3|
|**row2**|4|5|6|
</details>

Once you label the column/row names, you can reference values at certain indices using those names (using the example result, `A['row2', 'col1']` = `4`)

You can combine matrices using `cbind(m1, m2)` (if equal rows) or `rbind(m1, m2)` (if equal columns). Backwards, but it makes sense because `cbind` binds by attaching `m2` to the right side of `m1`. This is only possible if they have equal row counts. Same applies for `rbind` which attaching `m2` to the bottom of `m1`.

You can also output the contents as a single vector using `c(matrix)`

## Data Frame

You can generate a table using `data.frame(args*)` where `args*` represents a series of `col=vector` arguments.

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
