#######################
#     intro           #
#######################

# attributes vs. attr

attributes(mtcars)
attr(mtcars, 'names')

# data.frame attributes
names(mtcars)
row.names(mtcars)

row.names(mtcars)[1] <- 'unknown'
head(mtcars)

# rownames, colnames
# Retrieve or set the row or column names of a matrix-like object.
# For a data frame, rownames and colnames eventually call row.names and names respectively, but the latter are preferred.


# factors
df <- data.frame(name = c('Sarah', 'Ben', 'Judy'), sex = c('w','m','w'))
df

df$sex <- factor(df$sex)
df$sex 

# mtcars example
mtcars$g <- factor(mtcars$gear)



#######################
#     data types     #
#######################


# vectors
# seq(from = 1, to = 1, by = ((to - from)/(length.out - 1)), length.out = NULL, along.with = NULL, ...)

#seq.int(from, to, by, length.out, along.with, ...)

#seq_along(along.with)
a <- seq_along(letters)

#seq_len(length.out)
b <- seq_len(9)

rep(1,10)

# lists
l <- list(name = c('Anthony','Carl'))
attributes(l)

# matrices
m <- matrix(1:100, nrow = 5, ncol = 20)
attributes(m)
dim(m) <- c(10,10)

# data frame
df <- as.data.frame(m)
attributes(df)


row.names(df) <- letters[1:10]
attributes(df)

head(df)
summary(df)
str(df)


#######################
#     subsetting     #
#######################

# vectors
mpg <- mtcars$mpg
mpg[1:5]
mpg[c(39,72)]
mpg[c(3,7)]

mpg[-14] # all but

# list (double vs. square brackets, access by name and position)

# matrix
m
m[ ,1]
m[2, ]
m[3,3]


# data.frame

mtcars$cyl
mtcars$cyl[1]

# matrix-like
mtcars[1,7]
mtcars[1:3,7]

# array


#######################
#     vectorization   #
#######################

vec <- runif(100)
#vec <- 1:10
vec2 <- c()
for (i in vec) {vec2 <- c(vec2,log(i^2))}
vec3 <- log(vec^2)

all(vec2 == vec3)

vec <- runif(100000) 
system.time(for (i in vec) {vec2 <- c(vec2,log(i^2))})
system.time(vec3 <- log(vec^2))


#######################
#  loops &functions   #
#######################

x <- rnorm(20)
if(x>0) {1} else{2} #warning message:
ifelse(x>0, 1,2)
    
    

x1 <- read.csv('x.csv')
# why use readr? this already indicates sth went wrong
x2 <- read_csv('x.csv')
x2 <- read_csv('x.csv', col_names = c('id','name','score'))
x2 <- read_csv('x.csv', col_names = c('id','score'), col_types = 'd_d')
x2 <- read_csv('x.csv', col_names = c('id','name','score'), col_types = cols(score=col_double()))



#######################
#       plotting      #
#######################


#for ts objects:
data("AirPassengers")
ap <- AirPassengers
plot(ap)

plot(stl(ap, s.window = 12))

acf(ap)
pacf(ap)

library(forecast)
fit <- auto.arima(ap)
plot(fit)
plot(forecast(fit), include = 36)


#######################
#       lm            #
#######################

vals <- unclass(ap)
attr(vals, 'tsp') <- NULL
df <- data.frame(x = 1:length(ap), y = vals)
plot(df)
fit <- lm(y ~ x, lm)
summary(fit)


