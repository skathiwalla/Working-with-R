getwd()
setwd("")
data<-read.csv('cars.csv')
View(data)
data1<-read.csv('cars.csv')
View(data1)
class(data1)
data1[1:3,1:5]
data[c(1,3,5),c(1,5,8)]
data[1:3,c('Make','Model','MSRP')]

#check different classes
class(data$Make)
class(data$MSRP)
data$Model
names(data)
class(data)

str(data)
#statistical summary
summary(data)
summary(data$MSRP)
mean(data$MSRP)
mode(data$MSRP)

mean(data$EngineSize)
mode(data$EngineSize)

sapply(data1,class)

#accessing multiple columns
View(data[data1$Make =='Audi',c('Make','Model','MSRP','MPG_City','MPG_Highway')])


#add more conditions to access columns; sort of car models based on price
# car prices are >=28000 but <35000
#its like indexing data with a condition
View(data[data1$MSRP >=28000 & data1$MSRP < 35000,c('Make','Model','MSRP')])

View(data[data1$Make =='Audi' | data1$Make== 'BMW' |data1$Make== 'Mercedes-Benz',
          c("Make",'Model',"MSRP")])


#%in%==contains

Example<-data[data1$Make %in% c('Audi','BMW','Mercedes-Benz'),c("Make",'Model',"MSRP")]
View(Example)

#get class of each variable
class(data$Invoice)
class(data1)

#can remove duplicates with levels function
levels(data1$Model)

#data manipulation

l<-list(c(1,2,3,4),
          b=c('a','b','c'))
l
lapply(l,range)
sapply(l, range)
lapply(l, class)
sapply(l,class)

#converting the class into the character
lapply(l, as.character)
sapply(l,as.character)

#to get the class of each variable using 'for'
#cat function joins and prints
?cat
for (i in 1: ncol(data1)) {
  cat(names(data1[i]),":",class(data1[,i]))
}


####
temp_city_1 <- c(30,31,32,32,28,29,31)
temp_city_2 <- c(15,13,16,17,14,13,15)
temp_city_3 <- c(8,14,8,15,14,12,15)
temp_city_4 <- c(18,19,18,21,21,17,18)
temp_city_5 <- c(24,24,25,27,26,25,23)

#cbind(temp_city_1,temp_city_2) vs t(rbind(temp_city_1,temp_city_2)) 
#Bind as per rows and column


#?matrix(data, nrow, ncol, byrow, dimnames)
temp_vec <- c(temp_city_1,temp_city_2,temp_city_3,
              temp_city_4,temp_city_5)
mat <- matrix(data = temp_vec, 
              nrow = 5,ncol = 7,
              byrow = TRUE)

# colnames(mat) <- c('a','b','c','d','e','f','g')
# rownames(mat) <- c('a','b','c','d','e')
mat
mat1 <- matrix(data = temp_vec, 
               nrow = 5,ncol = 7,
               byrow = F)

temp_mat <- matrix(data = temp_vec, 
                   nrow = 5,ncol = 7,
                   byrow = TRUE,
                   dimnames = list(c('city_1', 'city_2', 'city_3',
                                     'city_4', 'city_5'),
                                   c('Sun','Mon','Tue','Wed',
                                     'Thu','Fri','Sat')))

mat[1,] # first row
mat[2,] # second row
mat[3,] # third row
mat[,2] # first column
mat[1,1] # first row and first column  
mat[,2] # second column

#Calling the specified element in a Matrix
mat[3, 4]; mat[3, 5]; mat[3, 6]
mat[4, 4]; mat[4, 5]; mat[4, 6]
mat[5, 4]; mat[5, 5]; mat[5, 6]

#Making the Sub-Matrix
mat[c(3,4,5), c(4,5,6)]  #First element with other element
mat[3:5,4:6]

for (i in 1:nrow(temp_mat)){
  print(mean(temp_mat[i,]))
}

for(i in 2:ncol(temp_mat)){
  print(mean(temp_mat[,i]))
}

class(temp_mat)

name <- c('John','Allison','Claire','Debra','Jack','Reed')
age <- c(32,25,27,28,22,35)
sex <- c('M','F','F','F','M','F')
height <- c(1.95,1.83, 1.78, 1.92, 1.87,1.75)
weight <- c( 69, 73, 11, 77, 75, 78)
mem <- c(TRUE, FALSE, TRUE, TRUE, F,T)


# dataframe : the structure should be conforming 
# multiple vector of same length

matrix(1:10, nrow = 3, ncol = 6)

data_example <- data.frame(name, age, sex, height, weight, mem)

class(data_example)
mode(data_example$mem)
mode(data_example$name)
typeof(data_example$mem)
typeof(data_example$height)
typeof(data_example$weight)
#understand diff between mode and typeof 
# typeof (determins the internal ( storage mode of any object)for height and weight return double; it represents a number
mode(data_example$sex)
typeof(data_example$sex)
?typeof
#?mode:get or set the type or storagemode of an object
?class
name<-name <- c('John','Allison','Claire','Debra','Jack','Reed','Allison','John')
age <- c(32,25,27,28,22,35,25,32)
sex <- c('M','F','F','F','M','F','F','M')
height <- c(1.95,1.83, 1.78, 1.92, 1.87,1.75,1.83,1.95)
weight <- c( 69, 73, 11, 77, 75, 78,73,61)
mem <- c(TRUE, FALSE, TRUE, TRUE, F,T,F,T)

df<-data.frame(name, age, sex, height,weight,mem)
df[duplicated(df),]# the comma is to remove duplicates by rows
unique(df)
english<-c(28,29,26,25,27,23)
math<-c(26,25,21,24,28,20)

dta<-data.frame(english, math)

#how to add a column in R in a data frame
cbind(data_example[,1:3],dta,data_example[,4:ncol(data_example)])
#cbind fn adds columns; first three columnss are from data example, 
#then dta data frame is called, and the two columns from dta are added;
#then the rest of the columns from data_example are added from column 4

name<-c('New1','New2')
age<-c(23,33)
sex<-c('M','F')
height<-c(1.88,1.76)
weight<-c(72,71)
mem<-c(F,T)

dd<-data.frame(name,age,sex,height,weight,mem)
#add rows
rbind(data_example,dd)
rbind(data_example[1:2,],dd,data_example[4:nrow(data_example),])

personal<-read.csv('Class_pers.csv')
marks<-read.csv('Class_marks.csv')
View(personal)
View(marks)

cp<-personal[c(7,4,12,5,15,18,11),]
cm<-marks[c(7,4,10,8,15,11,3),]

#primary key is the column thats common in both
#inner join: if the primary key is present both in left and right
#outer join:if the primary key is present in either
#left join: if the primary key is present in the left
#right join: if the primary key is present in the right

# inner merg, take all is False
unique(cp$Enrol.No.)
unique(cm$Enrol.No.)

merge(cp,cm,by='Enrol.No.', all=FALSE)

#outer merge/ join
merge(cp,cm,by='Enrol.No.', all=TRUE)

# left merge/join
merge(cp,cm,by='Enrol.No.', all.x =TRUE)

#right merge/join
merge(cp,cm,by='Enrol.No.', all.y =TRUE)

#April 5
data1["Avg"]<-(data1$MPG_City+data1$MPG_Highway)/2
View(data1)

#removing the columns
data1[1:5,c(1,2,3,7,9)]
data1[1:5,-c(1,4,5,7,8,9)]

# column number wheel base using which command
which(names(data1)=='Wheelbase')
which(names(data1) %in% c('Wheelbase','Length','Weight')    )
#indexing with which; this prints the first 5 rows with these three columns
data1[1:5,which(names(data1) %in% c('Wheelbase','Length','Weight')    )]


#delete
data1[1:5,c(-1,-14,-16)]

#sorting
a<-c(4.5,8.6,9.3,6.2)
#ascending order
sort(a)
#descending order
rev(sort(a))

#rank: tells you what the order of the numbers is in a vector
a
rev(rank(a))

# the rank function returns rank of each number in a vector in ascending order

#[1] 4.5 8.6 9.3 6.2
 rank(a)
#[1] 1 3 4 2

 
#order: this function tells you the actual position of 
#numbers in a vector is. Can be used on numeric data and dictionary
order(a) 

#order(a) 
#[1] 1 4 2 3

#sorting and order with characters
b<-c('bad','good','good','neutral','many')
a<-c(4.5,8.6,9.3,6.2)
sort(b)
rev(sort(b))
order(b) #1,2,4,3
rank(b) #1,2,4,3
c<-c('aaa','bbb','ccc','bba','ccb')
sort(c)   
rev(rank(a))#takes the output/answer of rank(a) and reverses it. 
            #it doesnt change anything in a


View(data1[order(data1$MPG_City, decreasing=F),]) # gives the indexed
#positions not the actual numbers that are in the column

#Ascending order
View(data1[sort(data1$MPG_City,decreasing=FALSE),c("Make","Model","MPG_City")])

?head# shows the first 6 rows and tail last 6 entries

#what is the mean for mpg_city for sedans for different makes
subdata<-data1[data1$Type=='Sedan',]
View (subdata)
#tapply is used to calculate statistics like min max, median and mean
tapply(subdata$MPG_City, subdata$Make, mean)

#Aggregate(summarize the data): mean in MPG_City
agg<-aggregate(data1$MPG_City, by=list(Type=data1$Type,Make=data1$Make),mean)
View(agg)
# rename a column
names(agg)[length(names(agg))]<-'Mean'
# here length name agg gives column 3
names(agg)[3]<-'New Mean'
#or change title for column 2
names(agg)[2]<- 'Car Make'
View (agg)

#Quantiles/ percentiles/
quantile(data1$MSRP,0.75)
quantile(data1$MSRP,0.01)
quantile(data1$Origin,0.75) # doesnt work for factors
quantile(data1$MPG_City,0.25)

Q1<-quantile(data1$MSRP,0.25)
Q3<-quantile(data1$MSRP,0.75)
Q3-Q1
iqr<-IQR(data1$MSRP)
iqr

quantile(data1$MPG_City)

#May 5th 2020
#get frequency of data
table(data1$Type)

#contingency table
table(data1$Make,data1$Type)

table(data1$Make,data1$Origin)

#Using plyr package and can summarize data in short forms without writing a lot of code

install.packages("dplyr")
library(dplyr)

#1 select: select columns;
head(select(data1,-Make, -Model,-Type, -MSRP))

#2 filter: filtering rows based on conditions
#3 Mutate:changing or creating new columns
head(mutate(data1,LWratio=Length/Weight, Wheelbase=NULL))
#NULL is used to omit columns 


#4 summarize: used to aggregate the result for data
#5 arrange data in a specific order

View(arrange(data1,desc(Make))) #arranged in descending order
?arrange

#get data for Audi cars where the price is >35,000
#want columns: Make, model, msrp, mpg city and mpg highway
#want to calculate LW ratio
#sort data in desc order of price for each Make

View(mutate(select(filter(data1,MSRP>35000,Make=='Audi'),
                     Make, Model, MSRP,MPG_City,MPG_Highway,Length, Weight),
      LWratio=Length/Weight,Length=NULL, Weight=NULL),
     (arrange(data1,desc(Make)))
     
#pipe operator usage:
#pipe commands are worked backwards: last command and moves up.
#so arrange is executed first and data is stored in select and then mutate,
# then filter and the all the results
#are forwarded to data1
#pipe operator distills and filters data
## the order of the functions below can be different and we can get the same result. 
final<-data1 %>%
  filter(MSRP>35000, Make =='Audi') %>%
  mutate(LWRatio=Length/Weight) %>%
  select(Make, Model, Make,MSRP,MPG_City,MPG_Highway) %>%
  arrange(Make, desc(MSRP))


#OR: mutate, filter, arrange select also works in this order.

View(final)
#for ascending either exclude desc or write rev(desc(Make))
#6 %>%: this operator will forward a value or result of an operation


#May 6 2020 Vizualization
cars<-read.csv(file.choose())
View(cars)
#bar plot

tab<-sort(table(cars$Type), decreasing=F)

barplot(tab,
        main="type of cars",
        xlab='Types',
        ylab='Frequency')

library(ggplot2)

ggplot(data = cars,mapping = aes (x=Type)) +
       geom_bar(stat='count')

#reorder: can be used with factors only

sex<-as.factor(c('M','F','M','F','M','F','M','F'))
reorder(sex,sex,FUN = length)


#descending order: 
#The FUN code is basically for desc function(x)-length(x)
ggplot(data = cars,
       mapping = aes(x= reorder(Type,Type,
                              FUN=function(x)-length(x)))) +
      geom_bar(stat='count')  
         
#ascending order: FUN=length for asc order
ggplot(data = cars,
       mapping = aes(x= reorder(Type,Type,
                              FUN=length))) +
  geom_bar(stat='count')

vc<-as.data.frame(table(cars$Type))
#-Freq is omitted as reorder works only on factors andnot numeric
ggplot(data = vc, mapping = aes(reorder(Var1,-Freq),
                                y=Freq,
                                col=Var1)) +
  geom_bar(stat = 'identity',fill = 'white') + #creates to legends
  xlab('Type') + #x axis lable
  ylab('Frequency') + #y axis label
  ggtitle('Type of cars') + #graph title
  theme(legend.title = element_text())

  
#piechart
pie(tab,radius = 1, main='Type of cars')

library(plotrix)

vc_Freq<-round(tab/sum(tab)*100,1)

pie3D(tab,labels = paste(names(tab),'-',vc_Freq,'%'),
      radius = 1.5,
      labelcex = 1,
      theta = pi/2, explode = 2)

#histogram
hist(cars$MSRP, breaks =70, axes = T )

#boxplot
boxplot(cars$MSRP, horizontal = T)

#May 7,2020

levels(cut(cars$MPG_City,breaks = quantile(cars$MPG_City)))
min(cars$MPG_City)
max(cars$MPG_City)
quantile(cars$MPG_City)
hist(cars$MPG_City, breaks = quantile(cars$MPG_City))

q1<-quantile(cars$MPG_City,0.25)
q3<-quantile(cars$MPG_City,0.75)
q3-q1

boxplot(cars$MPG_City, horizontal = T, range = 3)

abline(v=c(mean(cars$MSRP),
           median(cars$MSRP),
           q1,
           q3),
       col=c('red','steelblue','orange','magenta'))

#density plot: used for continour data; gives prob distribution of data
plot(density(cars$MSRP))
polygon(density(cars$MSRP), border = 'red')
abline(v=c(mean(cars$MSRP)), col = 'black',lwd = 1)

#statistics
#use pnorm to move from value to %
#qnorm to move from % to value

pnorm(84, mean = 72, sd = 15.2, lower.tail = F)
#mu=mean, sigma = std ,x=sample mean
mu<-440
sigma<-100
x<-400
z<-(x-mu)/sigma #we are concerned with the number not the sign
pnorm(z)


#May 8, 2020
#The avg stock price of cos in the S&P 500 is $30 with a 
#std of $8.2; assume stock price are normally distributed
#a. what is the probability that the price of a stock is at least $40
# 40 or more or 40 to infinity

pnorm(40, mean = 30, sd = 8.2, lower.tail = F)
#ans: 11.13% of the stocks have a value of over $40

#if lower.tail =T then area is from - infinity to x
pnorm(40, mean = 30, sd = 8.2, lower.tail = T)
#88.8% of the stocks ahve a price of below 88.9%

#if lower.tail=F then the area is from x to infinity
pnorm(40, mean = 30, sd = 8.2, lower.tail = F)

#b. what will be the probability that the stock price will be 
no higher than 20
1-pnorm(20, mean = 30, sd = 8.2, lower.tail = T)
#basically 1-.1113=0.8886

#how high does the stock price have to be to put the stock price
#in the top 10% (area from x to infinity) or from 90-100%
qnorm(0.1,mean = 30, sd = 8.2, lower.tail = F)
#$40.51

# bottom 10% from -ve infinity to x
qnorm(0.1,mean = 30, sd = 8.2, lower.tail = T)
#$19.49

#confidence interval at 95%; basically where mean=0 and sd=1 
qnorm(0.25, mean = 0, sd = 1, lower.tail = T)
qnorm(0.25, mean = 0, sd = 1, lower.tail = F)
#ans: -.6745 to +0.6745

#Neilsen media res conducted a study of TV viewing times from 8-11 pm
# pop std is known at 3.5 hrs; dev a 95% CI estimate the mean TV 
#viewing per week during the 8-11 time period

#mu=sample mean (xbar)+/- z(alpha/2)*sigma/sqrt(n)

neilsen<-read.csv(file.choose())
View(neilsen)
str(neilsen)

xbar<- mean(neilsen$Hours)
sigma<-3.5
n<-nrow(neilsen)
c<-.95
alpha<-1-c
z<-qnorm(alpha/2)
mu1<-xbar - z * (sigma/sqrt(n))
mu2<-xbar + z * (sigma/sqrt(n))

paste(round(mu2,1),'-' ,round(mu1,1))
#basically 95% CI time is 8.1-8.9



#t-test
#sample t test
#H0:mu(MSRP-Sedan)>=30000
#H1:mu(MSRP-sedan)<30000
sample <- cars[cars$Type == 'Sedan', 'MSRP']
xbar<- mean(sample)
s<- sd(sample)
n<- length(sample)
mu0<- 30000
t<- (xbar-mu0)/(s/sqrt(n))
#at alpha 5%
prob<- pt(t,n-1)

#p value <= alpha reject H0
#if p value > alpha accept H0
#p.test and q.test is for t .test
t.test(sample, mu0=30000, alternative = 'less')

#ans:
#One Sample t-test
#data:  sample
#t = 30.923, df = 261, p-value = 1
#alternative hypothesis: true mean is less than 0
#95 percent confidence interval:
#  -Inf 31362.96
#sample estimates:
 # mean of x 
#29773.62 
#FINAL ANS: we accept the H0 becasue the sample mean is calculated as
#$29773.62 and H0 says avg price of a car is $30K or higher. 
# so the price of $30K is at 40.7%. 

#May 11, 2020
# two samples one tail
#H0:bmw's are less expensive or just as expensive as audi
#H1: BMW cars are more expensive than Audi
##ANS: BMW cars are less exp or just as exp as Audi, based on p value of 0.5022

mu(MSRP BMW)>mu(MSRP Audi)
#or mu(MSRP BMW)-mu(MSRP AUDI)>0
sample1<-cars[cars$Make =='BMW', 'MSRP']
sample2<-cars[cars$Make =='Audi', 'MSRP']
  
t.test(sample2, sample1, alternative='less', paired=F, conf.level = 0.95 )

#Welch Two Sample t-test
#data:  sample2 and sample1
#t = 0.0054283, df = 36.338, p-value = 0.5022
#alternative hypothesis: true difference in means is less than 0
#95 percent confidence interval:
 # -Inf 7063.825
#sample estimates:
 # mean of x mean of y 
#43307.89  43285.25 


#BMW are more exp than Honda

#H1:mu(MSRP BMW)-mu(MSRP Honda)>0

sample1<-cars[cars$Make =='BMW', 'MSRP']
sample2<-cars[cars$Make =='Honda', 'MSRP']

t.test(sample2, sample1, alternative='greater', paired=F, conf.level = 0.95 )
#ANS since the p value is =1 we will reject the H1, and accept H0, BMW's are more expensive

sample_data<-read.csv('Sample_data.csv')
View(sample_data)
#since Math 1 & Math 2 scares are for the same student they are considered dependent

#two sided two sample test
#H0: there is no significant change in marks
#Math1 i score before course
#Math2: is score after course
#mu(Math1-Math2)==0
#ANS: H0 is accepted

sample1_p<-sample_data$Math1
sample2_p<-sample_data$Math2
boxplot(sample_data$Math1,sample_data$Math2)
#get the rest of the formula
t.test(sample1_p, sample2_p, alernative='two sided', conf.level=0.95)

#ANOVA: analysis of variance

n<-names(sort(table(cars$Make), decreasing = T) [1:5])
subdata<-cars[cars$Make %in% n, c('Make', 'MSRP')]
res<-aov(MSRP~Make, data=subdata)
#when you use anova you are comparing a continous variable with a categorical one

sample_data$Prog<-as.factor(sample_data$Prog)

#May 12, 2020

cars<-read.csv(file.choose())
View(cars)


sample_data['Total']<-apply(sample_data[,c('Read','Write','Math1','Math2','SST')], FUN= sum, MARGIN= 1)

View(sample_data)
sample_data$School <- as.factor(sample_data$School)
res1<- aov(Total ~ Prog + School, data = sample_data)

res2<- aov(Total ~ Prog * School, data = sample_data)
summary(res2)

summary(res)

# tukey test
# H0 : the pair is not significantly different
# Ha : the pair is significantly different 

TukeyHSD(res)

TukeyHSD(res2)

### chi square test 
###look up difference between chi square and anova

# h0 : gender and choice Prog are independent

obs_table <- table(sample_data$Gender, sample_data$Prog)
#anova is an extention of T test
#dof for chi sqr= (row-1)*(column-1)
chisq.test(obs_table)


housing <- read.csv(file.choose())
# housing file data 
# - CRIM     per capita crime rate by town
# - ZN       proportion of residential land zoned for lots over 25,000 sq.ft.
# - INDUS    proportion of non-retail business acres per town
# - CHAS     Charles River dummy variable (= 1 if tract bounds river; 0 otherwise)
# - NOX      nitric oxides concentration (parts per 10 million)
# - RM       average number of rooms per dwelling
# - AGE      proportion of owner-occupied units built prior to 1940
# - DIS      weighted distances to five Boston employment centres
# - RAD      index of accessibility to radial highways
# - TAX      full-value property-tax rate per $10,000
# - PTRATIO  pupil-teacher ratio by town
# - B        1000(Bk - 0.63)^2 where Bk is the proportion of blacks by town
# - LSTAT    % lower status of the population
# - MEDV     Median value of owner-occupied homes in $1000's


View(housing)
housing$CHAS <- as.factor(housing$CHAS)
## Correlation
attach(housing)
# after you attach() a data base all you have to do is use the variable without
#the database name and $

 
## plotting 
#dont have to type(housing$RM as we used attach fn)
plot(RM, MEDV)
abline(h = mean(MEDV), col = 'red')

plot(LSTAT, MEDV)

cor(LSTAT,MEDV)
cor(RM,MEDV)

pairs(housing)
library(dplyr)
cor_mat <- housing%>%
  select(-CHAS)%>%
  cor() %>%
  
#corrplot- gives you a graphical representation of correlation
    
library(corrplot)
corrplot(cor_mat, method = 'square', type = 'lower')
?corrplot

housing%>%
  select(-CHAS)%>%
  cor() %>% 
  corrplot(method = 'square', type = 'lower')

#May 13 2020

### predictive analytics

# divide the data into train and test

# linear regreesion
# simple linear regression : 1 x variable

mod <- lm(MEDV ~ RM, data = housing)

summary(mod)

library(readxl)
dataset <- read_excel(file.choose())
View(dataset)
# hypothesis for t test
# H0 : corresponnding beta (estimate) is non significant 
# corresponding beta = 0 
# the variable in question is non significant


mod_mml <- lm(MEDV ~ . , data = housing)
summary(mod_mml)

# adjusted r squraed : commpensates 
# the r squared value for redundancy in the model

# F statistics ANOVA 
# test the overall feasibility 
# H0 : none of variables are significant 

#
# residual standard error

# residual = y - ycap 

# for prediction y cap

ycap <- predict(mod_mml)

residuals <- MEDV - ycap

# alternatively 

yresid <- mod_mml$residuals

# root mean squared error :RMSE
SQR <- yresid^2
mse <- sum(SQR) / nrow(housing)
rmse <- sqrt(mse)

## assumptions 
# 1. Linearity
# 2. independence : all the x varaibles are independent
# 3. normality : residuals are normally distributed
# 4. Equal variance : residuals have equal variance

plot(mod_mml)


# multicollinearity 
# if correlation between x variables is high 
# VIF : variance inflation factor 
# VIF (X)  = 1 / ( 1- Rsquare (X))
#VIF value ranges between 0-100 and for this calculation 
#Rsqr has a max value of 0.99
#low VIF means model is good and low to no correlation between independent variables


RM

dt <- housing %>%
  select(-MEDV)

View(dt)
mod_RM <- lm(CRIM ~ . , data = dt)
a_rm <- summary(mod_RM)
rs <- a_rm$r.squared

# VIF (RM) 

1 / (1 - rs)

install.packages(c('readxl','rio','car'))

library(car)

vif(mod_mml)

# for the assumption to be true

## VIF for an X

#if R square for regression  is high : Y is being explained by X
#or X and Y are highly corelated 
# max value of R square = 1
# min value of R square = 0 

1 / ( 1- 0.99)  # 100 
1 / (1 - 0)  # 1

# low vif --> that there is no corelation 

# vif of 2 uptill 5 

cor_mat

dt1<- housing %>%
  select(-INDUS, - AGE, -CRIM, -CHAS) 

View(dt)

mm <- lm(MEDV ~. , data = dt)
vif(mm)
summary(mm)$r.squared
summary(mm)

X
#or X and Y are highly corelated 
# max value of R square = 1
# min value of R square = 0 

1 / ( 1- 0.99)  # 100 
1 / (1 - 0)  # 1

# low vif --> that there is no corelation 

# vif of 2 uptill 5 

cor_mat

dt<- housing %>%
  select(-INDUS, - AGE, -TAX) 
mm <- lm(MEDV ~. , data = dt)
vif(mm)
summary(mm)$r.squared

ry(mm)$r.squared

gc <- read.csv(file.choose())
View(gc)

# Target Rate

gc$Default <- as.factor(gc$Default)
class(gc$Default)
table(gc$Default)

# split the data 
# training data is used to fit your model. 
# Test data is used to validate your model. 
# Training set is the one on which we train and 
# fit our model basically to fit the parameters 
# whereas test data is used only to assess performance of model.

# train <- 70% develop 
# test <- 30 % validation 
set.seed(1234)
train_indices <- sample(1:nrow(gc), 0.70 * nrow(gc))
train <- gc[train_indices, ]
test <- gc[-train_indices,]
test$Default
# fit the model
class(train$Default) 
?glm
log_reg <- glm(Default ~ . , data = train, 
               family = 'binomial')

summary(log_reg)


levels(train$history)
# AIC - Akeike information Criterion
# information loss in building of the model
# - 2 ln L + 2 p
# lower value is preferred 

#############################
# Evaluation metrics for Classification Model

# Confusion Matrix
# actual vs Predicted
# prob of 1 for test data

pred_prob <- as.vector(predict(log_reg, newdata = test, 
                               type = 'response'))



# convert prob to class
# threshold = 0.5 
# if prob of 1 >0.5 then class = 1 else class =  0


pred_class <- as.factor(ifelse(pred_prob >= 0.5, 1, 0))


# Actual vs predicted 

table(pred_class, test$Default)

# Acurracy
(178 + 37)/300

table(test$Default)

random_class <- as.factor(rep(0, times = 300))

table(random_class,test$Default)
(209/300)
library(caret)
caret::confusionMatrix(pred_class, as.factor(test$Default), positive = '0')
class(random_class)
caret::confusionMatrix(random_class,as.factor(test$Default), positive = '0')

##########################################
#decision trees
#May 14, 2020

N <- nrow(train)
table(train$Default) 
levels(train$checkingstatus1)
#checkingstatus1 == A11 checkingstatus = A12 or A13 or A14


ncol(train)
nrow(train[train$checkingstatus1 != 'A11',])
table(train[train$checkingstatus1 != 'A11','Default'])

library(rpart)
class(train$Default)

mod <- rpart(Default~., data = train)
print(mod)


plot(mod, uniform = T, compress = T,
     margin = 0.2, branch = 0.3)

text(mod, use.n = F, digits = 3, cex = 1)
labels(mod)
library(rpart.plot)
rpart.plot(mod)

train

### lets the draw the full tree

ctrl <- rpart.control(minsplit = 2 , 
                      minbucket = 1,
                      cp = 0.0001)
# minsplit = minimum no, of samples for 
#              split. --> 2-3 times minbucket

# minbucket =  minimum no. of samples at the 
#                  terminal node  2-3% of the entire data
class(train$Default)
mod <- rpart(Default~., data = train, 
             control = ctrl, 
             method = 'class')
print(mod)

ctrl <- rpart.control(minsplit =  45, 
                      minbucket = 15,
                      cp = 0.01)
mod <- rpart(Default~., data = train, 
             control = ctrl, 
             method = 'class')
rpart.plot(mod)

pred_class <- predict(mod, newdata = test, type = 'class')
caret::confusionMatrix(pred_class, test$Default, positive = '0')

plotcp(mod)
mod$cptable



# 14_05
## decision trees can also be used as regression model 



# 
housing$MEDV

mmod <- rpart(MEDV~., data = housing, method = 'anova')
mmod
predict(mmod)

residuals <- MEDV - predict(mmod)

# alternatively 

yresid <- mod_mml$residuals

# root mean squared error :RMSE
SQR <- yresid^2
mse <- sum(SQR) / nrow(housing)
rmse <- sqrt(mse)

##################################
## K Nearest Neighbor

cardio <- read.csv(file.choose())
head(cardio)

# 1 -> normal
# 2 -> suspect
# 3 -> pathological

cardio$NSP<- as.factor(cardio$NSP)

# Split the data
set.seed(12)
tr_in <- sample(1 : nrow(cardio), 0.7*nrow(cardio))
train <- cardio[tr_in,]
test <- cardio[-tr_in,]
?scale
sapply(train[,-ncol(train)], FUN = mean, na.rm = TRUE)
sapply(train[,-ncol(train)], FUN = sd)
apply(train_std,FUN= sd, MARGIN = 2)
## Standardization of the data
library(dplyr)
train_std<- train%>%
  select(-NSP)%>%
  sapply(scale)
test_std <- test%>%
  select(-NSP)%>%
  sapply(scale)

# model 
library(class)
library(caret)
pred_class <- knn(train_std , test_std , train$NSP , k = 1)
cm<-caret::confusionMatrix(pred_class, test$NSP)
cm$overall['Accuracy']
for (i in 1:30){
  pred_class <- knn(train_std , test_std , train$NSP , k = i)
  cm <- caret::confusionMatrix(pred_class, test$NSP)
  acc <- cm$overall['Accuracy']
  cat(' k = ', i, 'accuracy = ',round(acc*100,2),'\n' )
  
}

pred_class <- knn(train_std , test_std , train$NSP , k = 11)
cm<-caret::confusionMatrix(pred_class, test$NSP)
cm

###########################################################

# Naive Bayes
gc

# Split the data
set.seed(12)
tr_in <- sample(1 : nrow(gc), 0.7*nrow(gc))
tr1 <- gc[tr_in,]
te1 <- gc[-tr_in,]

## Naive bayes --> e1071
library(e1071)

mod_nb <- naiveBayes(Default ~. , data = tr1)

mod_nb

prob <- predict(mod_nb, te1, type = 'raw')
cl <- predict(mod_nb, te1, type= 'class')
caret::confusionMatrix(cl, te1$Default, positive = '0')


# Principal Component Annalysis
ncol(cardio)
X_variables <- ncol(cardio) - 1
Y_vbariable <- 1

X_data <- cardio%>% select(-NSP)
head(X_data)

sum(sapply(X_data, var))

# standardise :
x_std<-sapply(X_data,scale)

apply(x_std, FUN = var, MARGIN = 2)
apply(x_std, FUN = mean, MARGIN = 2)
# each variable having unit variance 
sum(  apply(x_std, FUN = var, MARGIN = 2))


# with each variable in the model --> 1 unit var added 


#6 variables --> how much of total variance in the data 
#                is being used?

# 6/21 ==> 28.57%

# correlation matrix
cor_mat <- cor(x_std)

# Decommpostion
eig <- eigen(cor_mat)


# var capture for each component
eig$values
sum(eig$values)
# first PC captures the max variance
# first 6 PC 

sum(eig$values[1:6])/21


# scree plot

var_cap <- round(eig$values / sum(eig$values) 
                 * 100, 2)

cum_var <- cumsum(var_cap)

data.frame(PC = 1: length(var_cap),
           var = round(eig$values,2),
           var_cap = var_cap,
           cum_var = cum_var)
library(ggplot2)

qplot(1: length(var_cap), cum_var) +
  geom_step() +
  xlab('Principal Ccomponent')+
  ylab('VC')+
  ggtitle('Scree Plot')
#barplot(height = var_cap)


# 15_05
### pca 
pca <- prcomp(x_std)

pca$rotation[,1]

eig$vectors[,1]

View(pca$x)

factors <- pca$x[,1:6]

final_df <- data.frame(Target = cardio$NSP, factors)


set.seed(12)
tr_in <- sample(1 : nrow(cardio), 0.7*nrow(final_df))
train <- final_df[tr_in,]
test <- final_df[-tr_in,]




# model 
library(class)
pred_class <- knn(train , test, train$Target , k = 1)
cm<-caret::confusionMatrix(pred_class, test$Target)
cm$overall['Accuracy']
for (i in 1:30){
  pred_class <- knn(train , test , train$Target , k = i)
  cm <- caret::confusionMatrix(pred_class, test$Target)
  acc <- cm$overall['Accuracy']
  cat(' k = ', i, 'accuracy = ',round(acc*100,2),'\n' )
  
}

pred_class <- knn(train , test , train$Target , k = 11)
cm<-caret::confusionMatrix(pred_class, test$Target)
cm


### clustering

univ <- read.csv(file.choose())

View(univ)


# scale the data

sc <- scale(univ[,-1])

# Hierarchical

# distance matrix
d_mat <- dist(sc, method = 'euclidean')

h_clus <- hclust(d_mat, method = 'ward.D')

?hclust
# dendrogram
plot(h_clus, labels = as.character(univ$Univ),
     main = 'H Clustering')
rect.hclust(h_clus, k = 5)
rect.hclust(h_clus, k = 3, border = 'blue')

# No. of Cluster
library(NbClust)
?NbClust
nb <- NbClust(sc, method = 'ward.D')
nb$All.index
nb$Best.nc
# cluster labels for hier cluster

clus_labels <- cutree(h_clus, k = 3)

# Cluster profile

univ_hclus <- data.frame(univ, Cluster = clus_labels ) 

View(univ_hclus)

# mean for all cloumns for each group 
# no. of univ in each group 
prof <- univ_hclus %>%
  select(-Univ)%>%
  group_by(Cluster) %>%
  summarise_all(mean)

prof <- data.frame(prof[,1],
                   Freq = as.vector(table(univ_hclus$Cluster)),
                   prof[,-1])


################# K mmeans 

nb <- NbClust(sc, method = 'kmeans')
kmm <- kmeans(sc, 3)
clus_kmm<- kmm$cluster

# Cluster profile

univ_kmclus <- data.frame(univ, Cluster = clus_kmm ) 

View(univ_kmclus)

# mean for all cloumns for each group 
# no. of univ in each group 
prof_km <- univ_kmclus %>%
  select(-Univ)%>%
  group_by(Cluster) %>%
  summarise_all(mean)

prof_kmm <- data.frame(prof_km[,1],
                       Freq = as.vector(table(univ_kmclus$Cluster)),
                       prof_km[,-1])

kmm$tot.withinss
error <- c()
for (i in 1:(nrow(univ)-1)){
  kmm <- kmeans(sc, i)
  error<- c(error,kmm$tot.withinss)
  
}
plot(1:(nrow(univ)-1),error )


library(cluster)
clusplot(sc, kmm$cluster, color = TRUE , labels = 2)


##############################
#### Association rules   #####
##############################

library(arules)

# transaction data --> sparse matrix 


# read.transactions(file.choose())

data('Groceries')

summary(Groceries)

inspect(Groceries)

# item frequency
itfv <- itemFrequency(Groceries, type = 'absolute')
itfv[order(itfv, decreasing = T)]

# plotted
itemFrequencyPlot(Groceries, type = 'absolute', topN = 20)


itemFrequencyPlot(Groceries, type = 'relative', topN = 20)


# Rules

rules<- apriori(Groceries, parameter = list( supp = 0.01,
                                             conf = 0.01,
                                             minlen = 2))

rules

inspect(rules[1:5])
r_sort <- sort(rules, by = 'lift', decreasing = T)

inspect(r_sort[1:5])

###############################################################





