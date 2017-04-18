# Exercise 5: DPLYR Grouped Operations

# Install the nycflights13 package and read it in. Require the dplyr package.
# install.packages("nycflights13")
library(nycflights13)
library(dplyr)

# In which month was the average departure delay the greatest?
# Hint: you'll have to perform a grouping operation before summarizing your data
greatest.avg <- flights %>% group_by(month) %>% filter(dep_delay != 'NA') %>% summarise(mean = mean(dep_delay)) %>% top_n(n=1)

# If you create a data.frame with the columns "month", and "delay" above, you should be able to create 
# a scatterplot by passing it to the 'plot' function
month.delay <- flights %>% group_by(month) %>% filter(dep_delay != 'NA') %>% summarise(mean = mean(dep_delay))
plot(month.delay)

# In which airport were the average arrival delays the highest?
# Hint: you'll have to perform a grouping operation before summarizing your data
find.airport <- flights %>% group_by(origin) %>% filter(arr_delay != 'NA') %>% summarise(mean = mean(arr_delay)) %>% top_n(n=1)

### Bonus ###
# Which city was flown to with the highest average speed?
city <- flights %>% filter(air_time != 'NA') %>% mutate(speed = distance / air_time) %>% group_by(dest) %>% summarise(mean = mean(speed)) %>% top_n(n=1)
