# R language cheatsheet
## Part 3 - Givin' the user something nice w/ ggplot2

This page is heavily based off of the ggplot2 section of this article (feel free to read it for more info): http://zevross.com/blog/2015/01/13/a-new-data-processing-workflow-for-r-dplyr-magrittr-tidyr-ggplot2/

[Index page](https://github.com/enragednuke/R-language-cheatsheet/blob/master/README.md)

## ggplot-ing

This section won't really be like the others because `ggplot2` really only uses one method: `ggplot` (real surprise here). There will be a method index, though, for all the subsidiary methods you can attach to a `ggplot` base.

### Basic usage

You can generate a ggplot using this basic syntax

<details>
<summary>Code example</summary>
```R
ggplot(data, aes(x_col, y_col))

# However, you will need to have a visualization of the plots, so add geom_point
ggplot(data, aes(x_col, y_col))+geom_point(color=COLOR)
```
</details>

You may notice a weird pattern that `ggplot` generates its plots: It combines a series of additional `ggplot` methods as a 'concatenation' (adding them with `+`). This is consistent throughout the generation of ggplots.

