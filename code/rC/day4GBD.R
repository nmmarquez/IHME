pCompare <- function (dist, stat, ...){
    stDis <- sapply (c(20, 50, 100), function(y)
        sapply (1:5000, function (x) stat (dist (y, ...))))
    plot (density (stDis[,3]), col = 'blue',
          main = 'Sampling Distribution of...')
    lines (density (stDis[,2]), col = 'green')
    lines (density (stDis[,1]), col = 'red')
    legend ("topleft", legend = paste0 (c('100', '50', '20'), ' samples'),
            col = c('blue', 'green', 'red'), lty = 1)
}