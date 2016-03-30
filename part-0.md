# R cheatsheet
# Absolutely Basics of R

## Installing packages

```R
install.packages()
( you will be prompted to select a mirror to download from once per session )
( then you will be prompted for to select a package )
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
