## Лабораторна робота № 2. Функції lapply, sapply, split
## В лабораторній роботі необхідно виконати наступні дії:
## 1.	Створить список list1 <-  list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2)). 
## Для цього списку знайдіть sum за допомогою lapply.

list1 <- list(observationA = c(1:5, 7:3), observationB = matrix(1:6, nrow=2))
a_1 <- lapply(list1, sum)

##list1
##$`observationA`
## [1] 1 2 3 4 5 7 6 5 4 3
##$observationB
##     [,1] [,2] [,3]
##[1,]    1    3    5
##[2,]    2    4    6

##a_1
##$`observationA`
##[1] 40
##$observationB
##[1] 21

## 2.	Для кожного елементу списку list1 знайдіть максимальне та мінімальне значення (range) за допомогою lapply та sapply.

b_1 <- lapply(list1, range)
b_2 <- sapply(list1, range)

##b_1
##$`observationA`
##[1] 1 7
##$observationB
##[1] 1 6

##b_2
##observationA observationB
##[1,]            1            1
##[2,]            7            6

## 3.	Для вбудованого набору даних InsectSprays знайти середнє count для кожного spray.

d_frame <-data.frame(InsectSprays)
s <- split(InsectSprays, InsectSprays$spray)
l <- lapply(m, function(x) 
               mean(x$count))
s_ly <- sapply(m, function(x) 
               mean(x$count))

##d_frame
##     count spray
##1     10     A
##2      7     A
##3     20     A
##4     14     A
##5     14     A
##6     12     A
##7     10     A
##8     23     A
##9     17     A
##10    20     A
##11    14     A
##12    13     A
##13    11     B
##14    17     B
##15    21     B
##16    11     B
##17    16     B
##18    14     B
##19    17     B
##20    17     B
##21    19     B
##22    21     B
##23     7     B
##24    13     B
##25     0     C
##26     1     C
##27     7     C
##28     2     C
##29     3     C
##30     1     C
##31     2     C
##32     1     C
##33     3     C
##34     0     C
##35     1     C
##36     4     C
##37     3     D
##38     5     D
##39    12     D
##40     6     D
##41     4     D
##42     3     D
##43     5     D
##44     5     D
##45     5     D
##46     5     D
##47     2     D
##48     4     D
##49     3     E
##50     5     E
##51     3     E
##52     5     E
##53     3     E
##54     6     E
##55     1     E
##56     1     E
##57     3     E
##58     2     E
##59     6     E
##60     4     E
##61    11     F
##62     9     F
##63    15     F
##64    22     F
##65    15     F
##66    16     F
##67    13     F
##68    10     F
##69    26     F
##70    26     F
##71    24     F
##72    13     F

##s
##$`A`
##   count spray
##1     10     A
##2      7     A
##3     20     A
##4     14     A
##5     14     A
##6     12     A
##7     10     A
##8     23     A
##9     17     A
##10    20     A
##11    14     A
##12    13     A
##$B
##   count spray
##13    11     B
##14    17     B
##15    21     B
##16    11     B
##17    16     B
##18    14     B
##19    17     B
##20    17     B
##21    19     B
##22    21     B
##23     7     B
##24    13     B
##$C
##   count spray
##25     0     C
##26     1     C
##27     7     C
##28     2     C
##29     3     C
##30     1     C
##31     2     C
##32     1     C
##33     3     C
##34     0     C
##35     1     C
##36     4     C
##$D
##   count spray
##37     3     D
##38     5     D
##39    12     D
##40     6     D
##41     4     D
##42     3     D
##43     5     D
##44     5     D
##45     5     D
##46     5     D
##47     2     D
##48     4     D
##$E
##   count spray
##49     3     E
##50     5     E
##51     3     E
##52     5     E
##53     3     E
##54     6     E
##55     1     E
##56     1     E
##57     3     E
##58     2     E
##59     6     E
##60     4     E
##$F
##   count spray
##61    11     F
##62     9     F
##63    15     F
##64    22     F
##65    15     F
##66    16     F
##67    13     F
##68    10     F
##69    26     F
##70    26     F
##71    24     F
##72    13     F

##l
##$`A`
##[1] 14.5
##$B
##[1] 15.33333
##$C
##[1] 2.083333
##$D
##[1] 4.916667
##$E
##[1] 3.5
##$F
##[1] 16.66667

##s_ly
##A         B         C         D         E         F 
##14.500000 15.333333  2.083333  4.916667  3.500000 16.666667 
