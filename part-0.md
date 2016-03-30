# R cheatsheet
# Absolutely Basics of R

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

Conditionals:

|Symbol|Meaning|
|---|---|
|`|`|OR|
|`&`|AND|
|`!`|NOT|

### Vector logic

In R, the objects known as **Vectors** are basically just arrays from any other language in existence.

You can generate them using the syntax `c(args*)` which makes an array with contents `args*` so for example: `c(1,2,3)` = `[1, 2, 3]`. You can also use the `c(args*)` method to concatenate two vectors together, so `c(c(1,2,3), c(3,4,5))` = `[1, 2, 3, 3, 4, 5]`.

I **highly recommend** viewing the Vector portion of the guide I posted above. It will be extremely helpful in understanding how vector logic works. For example: adding (using `+`) two vectors together will not concatenate them, it will add the contents together. So `c(1,2,3) + c(3,4,5)` = `[4, 6, 8]`. Multiplying a vector will multiply its contents.

An important rule is known as the **recycling rule**. Operating on two vectors of different length will extend the shorter vector using its own values again. For example: `c(1,2,3) + c(3,4,5,6,7,8,9)` is essentially doing `c(1,2,3,1,2,3,1) + c(3,4,5,6,7,8,9)`.

<details>
<summary>**Nifty trick**: What will `c(1, -1) * c(1, 2, 4, 8, 16, 32)` create?</summary>
`[1, -2, 4, -8, 16, -32]`
aka an alternating sequence!
</details>

