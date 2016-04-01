# R language cheatsheet

Some useful stuff I've picked up while studying that sort of "data specific"

### Convert a column from one data type to another (i.e. dates)
 * **How**: `data$column_name <- as.DATA_TYPE(data$column_name)`
 * **Why does this work?**:
  * The `data$column` syntax cherrypicks a specific column from a set of data.
  * If you try to re-assign this columns (w/ `<-`) it will overwrite it (as you'd expect)
  * **Fun fact**: If you feed in a vector of data to `as.DATA_TYPE(...)`, it will return a vector with everything inside converted
  * This makes use of that, supplying the entirety of the column to the conversion, then sets the column equal to the result
