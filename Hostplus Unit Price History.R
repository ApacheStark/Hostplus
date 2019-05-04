##############################
# HOSTPLUS UNIT PRICE DATA
##############################

setwd("C:/Users/samgh/Desktop/Hostplus")

host <-
  read.delim("Hostplus Superannuation Daily Unit Prices 01Apr1988-01Apr2019.csv",
             sep = ',')

str(host)

View(host)

# After 10/11/2017 is unit rice, pre is perc change in unit price
# Grab all unit prices, not perc changes
library(dplyr)
library(lubridate)
host$X. <- host$X. %>%  dmy()
host_price <- host[host$X. > '2017-11-9', ]
View(host_price)

# Rename Date column
colnames(host_price)[1] <- 'Date'

# Remove PERIOD column and remove NA column at index 1
host_price <- host_price[2:nrow(host_price), 2:ncol(host_price)]

# Convert to numeric (double)
for (i in 1:ncol(host_price)) {
  if (class(host_price[, i]) == 'factor')
    host_price[, i] <- as.double(as.character(host_price[, i]))
  else
    host_price[, i] <- host_price[, i]
}

# Remove NA dominant Columns
host_price <-
  host_price[, colSums(is.na(host_price)) < nrow(host_price)]

# Establish ylim values
summary(host_price)
# min 0.9 max 2.2

# Visualise Unit Prices
plot(
  host_price$Date,
  host_price$Capital.Stable,
  ylim = c(0.9, 2.5),
  type = 'l',
  main = 'HostPlus Unit Prices from 10-11-2017',
  xlab = 'Year',
  ylab = 'Unit Price (AUD)'
)
lines(host_price$Date, host_price$Conservative.Balanced, col = 'red')
lines(
  host_price$Date,
  host_price$Socially.Responsible.Investment..SRI....Balanced,
  col = 'blue'
)
lines(host_price$Date, 
      host_price$Indexed.Balanced, col = 'pink')
lines(host_price$Date, 
      host_price$Balanced, col = 'brown')
lines(host_price$Date, 
      host_price$Shares.Plus, col = 'orange')
lines(host_price$Date, 
      host_price$Cash, col = 'green')
lines(host_price$Date, 
      host_price$Diversified.Fixed.Interest , col = 'cyan')
lines(host_price$Date, 
      host_price$Property, col = 'green3')
lines(host_price$Date, 
      host_price$Australian.Shares, col = 'red2')
lines(host_price$Date, 
      host_price$International.Shares, col = 'blue3')
lines(host_price$Date,
      host_price$International.Shares...Indexed,
      col = 'purple')
lines(host_price$Date,
      host_price$International.Shares..Hedged....Indexed,
      col = 'cyan3')
lines(
  host_price$Date,
  host_price$Macquarie.Investment.Management...Australian.Fixed.Interest,
  col = 'light blue'
)
lines(
  host_price$Date,
  host_price$BlackRock.Asset.Management...International.Fixed.Interest,
  col = 'grey'
)
lines(
  host_price$Date,
  host_price$Industry.Super.Property.Trust.Core.Fund...Property,
  col = 'blue',
  lty = 2
)
lines(
  host_price$Date,
  host_price$Lend.Lease.managed.Australian.Prime.Property.Funds..Retail..Commercial...Industrial....Property,
  col = 'red',
  lty = 2
)
lines(
  host_price$Date,
  host_price$IFM...Australian.Infrastructure,
  col = 'black',
  lty = 2
)
lines(
  host_price$Date,
  host_price$Balanced.Equity.Management...Australian.Shares,
  col = 'pink',
  lty = 2
)
lines(
  host_price$Date,
  host_price$IFM...Australian.Shares,
  col = 'purple',
  lty = 2
)
lines(
  host_price$Date,
  host_price$Paradice.Investment.Management..Small.Cap....Australian.Shares,
  col = 'green',
  lty = 2
)
lines(
  host_price$Date,
  host_price$Neuberger.Berman...International.Shares,
  col = 'orange',
  lty = 2
)

