############################## 
# HOSTPLUS UNIT PRICE DATA
##############################

setwd("C:/Users/samgh/Desktop/Hostplus")

host <- read.csv("Hostplus Superannuation Daily Unit Prices 01Apr1988-01Apr2019.csv")
host <- read_csv()

host <- read.delim("Hostplus Superannuation Daily Unit Prices 01Apr1988-01Apr2019.csv", sep = ',')

str(host)

View(host)

# after 10/11/2017 is unit rice, pre is perc change in unit price