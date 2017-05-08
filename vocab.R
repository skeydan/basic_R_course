##################################################################
#                       The basics                               #
##################################################################


################ The first functions to learn ####################

?
str


################ Important operators and assignment ##############

`%in%` # returns a logical vector indicating if there is a match or not for its left operand
1:10 %in% c(1,3,5,9)
sstr <- c("c","ab","B","bba","c",NA,"@","bla","a","Ba","%"); sstr[sstr %in% c(letters, LETTERS)]
"%w/o%" <- function(x, y) x[!x %in% y]; (1:10) %w/o% c(3,7,12)

match # returns a vector of the positions of (first) matches of its first argument in its second.
match(2, c(3,2,1,4,2))
match(2:3, c(3,2,1,4,2))
match(123, c(3,2,1,4,2), nomatch = 999)

`=`
`<-`
`<<-`
`$`
`[`
`[[`
  
head
tail

subset #Return subsets of vectors, matrices or data frames which meet conditions.
      #This is a convenience function intended for use interactively. For programming it is better to use the standard subsetting functions like [, and in particular the non-standard evaluation of argument subset can have unanticipated consequences.

# Default S3 method: subset(x, subset, ...)
# For ordinary vectors, the result is simply x[subset & !is.na(subset)]
vec <- airquality$Ozone; subset(vec, vec > 100)

# The select argument exists only for the methods for data frames and matrices.
# S3 method for class 'data.frame' and 'matrix': subset(x, subset, select, drop = FALSE, ...)
# For data frames, the subset argument works on the rows. 
subset(airquality, Temp > 80, select = c(Ozone, Temp))
subset(airquality, Day == 1, select = -Temp)
subset(airquality, select = Ozone:Wind)

# The drop argument is passed on to the indexing method for matrices and data frames: note that the default for matrices is different from that for indexing.
class(subset(airquality, select = Ozone))
class(subset(airquality, select = Ozone, drop = TRUE))

with # with(data, expr, ...)
# with is a generic function that evaluates expr in a local environment constructed from data
# assignments within expr take place in the constructed environment and not in the user's workspace.
with(diamonds, lm(price ~ carat + cut))

within 
# within is similar, except that it examines the environment after the evaluation of expr and makes the corresponding modifications to a copy of data, and returns it. 
aq <- within(airquality, {     # Notice that multiple vars can be changed
  lOzone <- log(Ozone)
  Month <- factor(month.abb[Month])
  cTemp <- round((Temp - 32) * 5/9, 1) # From Fahrenheit to Celsius
  S.cT <- Solar.R / cTemp  # using the newly created variable
  rm(Day, Temp)
})

assign
for(i in 1:6) {nam <- paste("r", i, sep = "."); assign(nam, 1:i)}

get
e1 <- new.env()
get("c", e1)
#  If no object is found an error results.
get("c", e1, inherits = FALSE)
mget("c", e1, inherits = FALSE, ifnotfound = 999)

class(get("%o%"))
     


################ Comparison ##############

     
all.equal #utility to compare R objects x and y testing 'near equality'
# S3 method for class 'numeric'
# all.equal(target, current, tolerance = sqrt(.Machine$double.eps), scale = NULL, ..., check.attributes = TRUE)
# double.eps the smallest positive floating-point number x such that 1 + x != 1

d45 <- pi*(1/4 + 1:10)
all.equal(tan(d45), rep(1, 10))        # TRUE, but
all (tan(d45) == rep(1, 10))         # FALSE, since not exactly
all.equal(tan(d45), rep(1, 10), tolerance = .Machine$double.eps/2)  # to see difference

# safe and reliable way to test two objects for being exactly equal.
# returns "a single logical value, TRUE or FALSE, never NA and never anything other than a single value."
identical
identical(d45, rep(1,10))
identical(1, 1.)   ## TRUE in R (both are stored as doubles)
identical(1, as.integer(1)) ## FALSE, stored as different types
identical(.GlobalEnv, environment())

`!=`
`==`
`>`
`>=`
`<`
`<=`
`is.na`

complete.cases
x <- airquality[, -1] # x is a regression design matrix
y <- airquality[,  1] # y is the corresponding response
ok <- complete.cases(x, y)
sum(!ok) # how many are not "ok" ?
x <- x[ok,]
y <- y[ok]


is.finite
   

################ Basic math ##############

       
`*`
`+`
`-`
`/`
`^`
`%%` # x mod y
`%/%`# integer division

abs
sign
acos
asin
atan
atan2
sin
cos
tan

ceiling
floor
round
trunc
# signif vs. round
x2 <- pi * 100^(-1:3)
x2
round(x2, 3)
signif(x2, 3)


exp
log
log10
log2
sqrt
          
max
min
#prod
prod(1,2,3)
prod(1:2,3:4)
prod(NA,1)
prod(NULL,1)
prod(FALSE,1)
sum

#cummax
cummax(c(1,4,2,6,4,8))
cummin
cumprod
cumsum

diff

# parallel max/min
pmax
pmin
pmin(5:1, pi)

#range
x <- c(NA, 1:3, -1:1/0); x
range(x)
range(x, na.rm = TRUE)
range(x, finite = TRUE)
range(1:10)
range(1,10)


          mean, median, cor, sd, var
          rle
          
          # Functions to do with functions
          function
          missing
          on.exit
          return, invisible
          
          # Logical & sets 
          &, |, !, xor
          all, any
          intersect, union, setdiff, setequal
          which
          
          # Vectors and matrices
          c, matrix
          # automatic coercion rules character > numeric > logical
          length, dim, ncol, nrow
          cbind, rbind
          names, colnames, rownames
          t
          diag
          sweep
          as.matrix, data.matrix
          
          # Making vectors 
          c
          rep, rep_len
          seq, seq_len, seq_along
          rev
          sample
          choose, factorial, combn
          (is/as).(character/numeric/logical/...)
          
          # Lists & data.frames 
          list, unlist
          data.frame, as.data.frame
          split
          expand.grid
          
          # Control flow 
          if, &&, || (short circuiting)
          for, while
          next, break
          switch
          ifelse
          
          # Apply & friends
          lapply, sapply, vapply
          apply
          tapply
          replicate

          
          
##################################################################
#                      Common data structures                    #
##################################################################
        
          # Date time
          ISOdate, ISOdatetime, strftime, strptime, date
          difftime
          julian, months, quarters, weekdays
          library(lubridate)
          
          # Character manipulation 
          grep, agrep
          gsub
          strsplit
          chartr
          nchar
          tolower, toupper
          substr
          paste
          trimws
          library(stringr)
          
          # Factors 
          factor, levels, nlevels
          reorder, relevel
          cut, findInterval
          interaction
          options(stringsAsFactors = FALSE)
          
          # Array manipulation
          array
          dim
          dimnames
          aperm
          library(abind)          
          
          
##################################################################
#                       Statistics                               #
##################################################################
          
          # Ordering and tabulating 
          duplicated, unique
          merge
          order, rank, quantile
          sort
          table, ftable
          
          # Linear models 
          fitted, predict, resid, rstandard
          lm, glm
          hat, influence.measures
          logLik, df, deviance
          formula, ~, I
          anova, coef, confint, vcov
          contrasts
          
          # Miscellaneous tests
          apropos("\\.test$")
          
          # Random variables 
          (q, p, d, r) * (beta, binom, cauchy, chisq, exp, f, gamma, geom, 
                          hyper, lnorm, logis, multinom, nbinom, norm, pois, signrank, t, 
                          unif, weibull, wilcox, birthday, tukey)
          
          # Matrix algebra 
          crossprod, tcrossprod
          eigen, qr, svd
          %*%, %o%, outer
          rcond
          solve
          
          
          
          
                   
##################################################################
#                      Working with R                            #
##################################################################
          
          # Workspace 
          ls, exists, rm
          getwd, setwd
          q
          source
          install.packages, library, require
          
          # Help
          help, ?
          help.search
          apropos
          RSiteSearch
          citation
          demo
          example
          vignette
          
          # Debugging
          traceback
          browser
          recover
          options(error = )
          stop, warning, message
          tryCatch, try         
          
          
##################################################################
#                       IO                                       #
##################################################################
          
          
          # Output
          print, cat
          message, warning
          dput
          format
          sink, capture.output
          sprintf
          
          # Reading and writing data
          data
          count.fields
          read.csv, write.csv
          read.delim, write.delim
          read.fwf
          readLines, writeLines
          readRDS, saveRDS
          load, save
          library(foreign)
          
          # Files and directories 
          dir
          basename, dirname, tools::file_ext
          file.path
          path.expand, normalizePath
          file.choose
          file.copy, file.create, file.remove, file.rename, dir.create
          file.exists, file.info
          tempdir, tempfile
          download.file, library(downloader)         
          
          
          
          
          
          
          