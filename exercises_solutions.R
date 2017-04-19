# 1
# In the mpg dataset, which comes with ggplot2, how many different manufacturers are there?

library(ggplot2)
data("mpg")
length(levels(factor(mpg$manufacturer)))
# or
length(unique(mpg$manufacturer))

# 2
# How many different classes of car?
length(unique(mpg$class))

# 3
# How many rows does the dataset have?
nrow(mpg)

# 4
# How many columns?
ncol(mpg)

# 5
# How many suvs are there?
mpg[mpg$class == 'suv', ]

# 6
# Of the suvs, how many are from 2008 or newer?
suvs <- mpg[mpg$class == 'suv', ]
suvs2008 <- suvs[suvs$year >= 2008, ]

# 7
# Of those, what's the maximum displacement?
max(suvs2008$displ)

# 8
# What's the minimum number of cylinders overall?
max(mpg$cyl)

# 9
# Look at cty simply as a vector of numbers. What is the sum of the numbers if you remove the fourth element?
cty <- mpg$cty
sum(cty[-4])

# 10
# What's the sum (not removing anything this time) if you take the square root of every element?
sum(sqrt(cty))

# 11
# What's the sum if you add a random number to every value?
# The random number should be drawn from a normal distribution with mean 100 and standard deviation 5.
# It should be a different number every time!
rands <- rnorm(length(cty), mean = 100, sd=5)
sum(cty + rands)

#compare
c <- 1:10
c + rnorm(1)
c + rnorm(10)

# 12
# Take the first 200 elements of cty only. 
# If you reshape them to a matrix with 40 rows and 5 columns, what's the average of the first, second and third rows?

m <- matrix(cty[1:200], nrow = 40)
apply(m, 1, mean)[1:3]

# 13
# What are the column averages?
apply(m, 2, median)


