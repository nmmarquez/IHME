set.seed (123)

small <- sapply (1:1000, function (x) 
    mean (rnorm (10, 40, 15) + (rbinom (10, 1, .1) * 30)))

large <- sapply (1:1000, function (x) 
    mean (rnorm (1000, 40, 15) + (rbinom (1000, 1, .1) * 30)))

summary (small - 40)
summary (large - 40)

smallT <- sapply (1:1000, function (x) 
    mean (rnorm (10, 40, 15) + (rbinom (10, 1, .1) * 30), trim = .2))

largeT <- sapply (1:1000, function (x) 
    mean (rnorm (1000, 40, 15) + (rbinom (1000, 1, .1) * 30), trim = .2))

summary (smallT - 40)
summary (largeT - 40)
