
library(readxl)

#create a variable and to read the hospital cost data 
hospital<-read_excel('Hospital costs assessment project 2020.xlsx')

#look at all the data in the file
View(hospital)


#class is a data frame with 500 observations and 6 variables.
class(hospital)

#all the columns are structured as numerical, while FEMAL and Race can be changed to Factor i have left it as 
#neumeric for regression calculations

str(hospital)
str(hospital$AGE)


#summary of the provided data: 
#there are 256 females and 244 males with 1 N/A. 
#their age groups range between new borns and 17
#length of stay ranges between 0 and 41 days. with a mean of 2.83 days 
#and a median of 2 days. 
#Race: the only data is by number and Race1 has most of the data with
#484 counts or 97%, 
#race2: has 6 observations
#TOTCHG: Min charge is $532 with a Maax of $48388; 
#the average cost of $2774 with 
#a median cost of $1536
#diagnosis related groups: there are 5 major groups, the group with the most entries is 640 with 267 entries
#and group called other which has 126 entries which is the second highest. 
#NOTE: there is no way of knowing if the same patient is readmitted as the 
#patient data has been de-identified 
summary(hospital)


#1. Age category of people who have the maximum expenditure. 

# table by age shows that newborns are the largest category with 307  
age_table<-table(as.factor(hospital$AGE))
View(age_table)

#this can also be seen in the histogram provided
hist(hospital$AGE)

#The age category with the maximum expenditure are:
#(0 or newborns with 308 observations) the hospital cost is the 
#highest at $678,118/-. 
#the second highest group is 17 (38 entires) year olds at $174,777;
#with 15 year olds (entries 29) being the third higest group at $111,747.
# since the paitiens have been de-identified we cannot talk about frequency 
#readmission of any single patient. 

zeroage=aggregate(x=hospital$TOTCHG,by=list(hospital$AGE),FUN=sum)
names(zeroage)[1]<-'AGE'
names(zeroage)[2]<-'Total Cost $'
View(zeroage)

#2. In order of severity of the diagnosis and treatments and to find out the 
#expensive treatments, the agency wants to find the diagnosis-related group
#that has maximum hospitalization and expenditure.

#there are 63 unique diagnosis related groups; 
#APRGRD 640 has the largest frequency of hospitalizations at 267 with a total cost of $437,978; 
#2 APRDRG is 754 with 37 occurencies  and a total cost of $59,150 and
#3 is 753 with 36 occurances and a total cost of $79,942.
#NOTE: while APRDRG 53 only has 10 occurances its total cost is second highest at $82,271. 


hospital_severiety<-table(hospital$APRDRG)
View(hospital_severiety)

severiety_cost=aggregate(x=hospital$TOTCHG,by=list(hospital$APRDRG),FUN=sum)

names(severiety_cost)[1]<-'Diagnosis Related Groups'
names(severiety_cost)[2]<-'Total Cost $'

sorted_severiety<-severiety_cost[order(severiety_cost$`Total Cost $`, decreasing = T),]

View(sorted_severiety)

#3. To make sure that there is no malpractice, the agency needs to analyze 
#if the race of the patient is related to the hospitalization costs.

#I dont belive there is enough information about the greneral race break down 
#of the neighbourhoods around Wisconsin where the patients originate. 
# also while i have provided cost per patient for comparision purposes 
#I dont believe we can make decisions with that information without considering 
#many factors like APRDRG and LOS. 

#the race of patient data is broken down into 6 groups. 
#Group 1 has the most patients at 484 for a total cost of $1,341,972 
#cost per patient(cpp) for this group is $2772.
#Group 2 has 6 registered patients while $25,213 with a cpp of $4202.
#Groups 4 & 5 each have 3 registered patients $7,034 (cpp:$2345), $6,080 (cpp:$2026).


malpractice<-table(hospital$RACE)
View(malpractice)

malpractice_cost=aggregate(x=hospital$TOTCHG,by=list(hospital$RACE),FUN=sum)
names(malpractice_cost)[1]<-'Race'
names(malpractice_cost)[2]<-'Total Cost $ by race'

View(malpractice_cost)

#4. To properly utilize the costs, the agency has to analyze the severity 
#of the hospital costs by age and gender for the proper allocation of 
#resources.

#there are 170 newborn boys with a total cost of $373,734 (cpp $2198)and 
#137 new born girls with a total cost of $304,384 ($2,222). 
#the costs per child are pretty similar but doesnt take into account 
# any conditions they might have had.


age_gender_cost<-table(hospital$FEMALE,hospital$AGE)
View(age_gender_cost)


cost_age_gender=aggregate(x=hospital$TOTCHG,by=list(hospital$AGE,hospital$FEMALE),FUN=sum)

names(cost_age_gender)[1]<-'AGE'
names(cost_age_gender)[2]<-'GENDER'
names(cost_age_gender)[3]<-'Cost by age/gender'

sorted_cost_age<-cost_age_gender[order(cost_age_gender$`Cost by age/gender`, decreasing = T),]
View(sorted_cost_age)
#5. Since the length of stay is the crucial factor for inpatients, 
#the agency wants to find if the length of stay can be predicted from age, 
#gender, and race.
#give the high p-value of 0.2692 (above0.05) 
#and the Adjusted R sqr is low at 0.001886, i would say that age, gender and race
#are not good predictors of length of hospital stay. 
#I think diagnosis and severiety of infection are better predictors of LOS

LOS_table<-table(hospital$AGE,hospital$FEMALE,hospital$RACE)
View(LOS_table)

LOS_predict=lm(hospital$LOS~hospital$AGE+hospital$FEMALE+hospital$RACE,data=hospital)
summary(LOS_predict)
 
LOS_diagnosis<-lm(hospital$LOS~hospital$APRDRG, data=hospital)
summary(LOS_diagnosis)

#6. To perform a complete analysis, the agency wants to find the variable 
#that mainly affects hospital costs.

#With an adjusted R sqr of 0.5481 and a p-value below 0.05 at (2.2e-16). 
#Age, length of stay and diagnosis mainly impact hospital costs.

predictor_variable<-lm(hospital$TOTCHG~.,data=hospital)
summary(predictor_variable)
