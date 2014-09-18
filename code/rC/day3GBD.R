library(foreign)
setwd("J:/temp/bootCamp/stataWorkshop/data")

gbd <- read.dta ("GBD+WorldBank.dta")
gbd <- gbd[with(gbd, order(country, year)),]
gbd$firstRec <- !duplicated(gbd$country)
?unique
n_ <- function (vec){
    temp <- c(); final <-c()
    for (v in vec){
        temp <- c(temp,v); final <- c(final, sum(v==temp))
    }
    final
}
