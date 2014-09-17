meanBi <- sapply (c(20, 50, 100), function(y)
    sapply (1:5000, function (x) mean (rbinom (y, 1, .6))))

meanPoi <- sapply (c(20, 50, 100), function(y)
    sapply (1:5000, function (x) mean (rpois (y, 1.8))))

sdBi <- sapply (c(20, 50, 100), function(y)
    sapply (1:5000, function (x) sd (rbinom (y, 1, .6))))

sdPoi <- sapply (c(20, 50, 100), function(y)
    sapply (1:5000, function (x) sd (rpois (y, 1.8))))

plot (density (meanBi[,3]), col = 'blue',
      main = 'Sampling Distribution of Mean of Binomial Dist.')
lines (density (meanBi[,2]), col = 'green')
lines (density (meanBi[,1]), col = 'red')
legend ("topleft", legend = paste0 (c('100', '50', '20'), ' samples'),
        col = c('blue', 'green', 'red'), lty = 1)

plot (density (meanPoi[,3]), col = 'blue',
      main = 'Sampling Distribution of Mean of Poisson Dist.')
lines (density (meanPoi[,2]), col = 'green')
lines (density (meanPoi[,1]), col = 'red')
legend ("topleft", legend = paste0 (c('100', '50', '20'), ' samples'),
        col = c('blue', 'green', 'red'), lty = 1)
