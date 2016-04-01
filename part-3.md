# R language cheatsheet
## Part 3 - Givin' the user something nice w/ ggplot2

This page is **very heavily** based off of the ggplot2 section of this article (feel free to read it for more info): http://zevross.com/blog/2015/01/13/a-new-data-processing-workflow-for-r-dplyr-magrittr-tidyr-ggplot2/

If you want to see visual representations of what each of the subsidiary methods / code snippets do, see that link (it has images)

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

## Code snippets

This will be a list of small snippets to help do basic graphing

* **Edit X/Y-axis graph labels**
 * `labs(x=character, y=character, title=character)`
* **Removing labeling/ticks on axes**
 * `theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())`
 * (note: you can `.x` for x-axis)
* **Rotate/change size of 'tick label' text**
 * `theme(axis.text.x=element_text(angle=int, size=int, vjust=dbl))`
 * (note: this uses the `element_text` method mentioned below)

## Subsidiary Method Index (SMI)

These are all methods you `+` to a `ggplot` object

As always, there are more parameters than I give, but I'm providing the basics. Type `?method` in the console for more info.

### Adding point visualization
So stuff shows up on the graph, duh

* **Usage**: `geom_point(color=COLOR)`
* **Params**
  * `color` is a the color of the dots (use a string)

### Adding a title
If you need an explanation for this, there's a problem

 * **Usage**: `ggtitle(NAME)` or `labs(title=NAME)`
 * **Params**
  * Supply a string in place of `NAME`

## Stylizing
This allows you customize **many** elements of the graph

 * **Usage**: `theme(args*)`
 * There are **a lot** of potential parameters. *Please* see `?theme` for a list of potential `args`

Example: `theme(plot.title = element_text(size=20, face="bold", margin=margin(10, 0, 10, 0)))` will give the title of the graph a bold face, larger size, and padding around it.

**Note**: The other method shown here, `element_text`, also has a **ton** of potenttial arguments. See `?element_text` for more information.

