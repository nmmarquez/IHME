smallMB <- sapply (1:5000, function (x) mean (rbinom (20, 1, .6)))
medMB <- sapply (1:5000, function (x) mean (rbinom (50, 1, .6)))
largeMB <- sapply (1:50000, function (x) mean (rbinom (100, 1, .6)))

smallMP <- sapply (1:5000, function (x) mean (rpois (20, 1.8)))
medMP <- sapply (1:5000, function (x) mean (rpois (50, 1.8)))
largeMP <- sapply (1:5000, function (x) mean (rpois (100, 1.8)))

smallSB <- sapply (1:5000, function (x) sd (rbinom (20, 1, .6)))
medSB <- sapply (1:5000, function (x) sd (rbinom (50, 1, .6)))
largeSB <- sapply (1:5000, function (x) sd (rbinom (100, 1, .6)))

smallSP <- sapply (1:5000, function (x) sd (rpois (20, 1.8)))
medSP <- sapply (1:5000, function (x) sd (rpois (50, 1.8)))
largeSP <- sapply (1:5000, function (x) sd (rpois (100, 1.8)))

plot (density (largeMB), col = 'blue',
      main = 'Sampling Distribution of Mean of Binomial Dist.')
lines (density (medMB), col = 'green')
lines (density (smallMB), col = 'red')
legend ("topleft", legend = paste0 (c('100', '50', '20'), ' samples'),
        col = c('blue', 'green', 'red'), lty = 1)

plot (density (largeMP), col = 'blue',
      main = 'Sampling Distribution of Mean of Poisson Dist.')
lines (density (medMP), col = 'green')
lines (density (smallMP), col = 'red')
legend ("topleft", legend = paste0 (c('100', '50', '20'), ' samples'),
        col = c('blue', 'green', 'red'), lty = 1)
