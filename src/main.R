install.packages("tidyverse")
install.packages("lubridate")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("tidyr")
install.packages("here")
install.packages("skimr")
install.packages("janitor")

# loading packages

library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)
library(here)
library(skimr)
library(janitor)

## Importing datasets (Prepare / Explore)
# for Activity dataset:

Activity <- read.csv("dailyActivity_merged.csv")
head(Activity)
colnames(Activity)
str(Activity)
glimpse(Activity)

# for Calories dataset

Calories <- read.csv("dailyCalories_merged.csv")
head(Calories)
colnames(Calories)
str(Calories)

# for Intensities dataset

Intensities <- read.csv("dailyIntensities_merged.csv")
head(Intensities)
colnames(Intensities)
str(Intensities)

# for Heartrate dataset

Heartrate <- read.csv("heartrate_seconds_merged.csv")
head(Heartrate)
colnames(Heartrate)
str(Heartrate)


# for Sleep dataset
Sleep <- read.csv("sleepDay_merged.csv")
head(Sleep)
colnames(Sleep)
str(Sleep)

# for Weight dataset 
Weight <- read.csv("weightLogInfo_merged.csv")
head(Weight)
colnames(Weight)
str(Weight)



## Cleaning the dataset (Process Phase)

#Cleaning up with the basics
# for Activity

glimpse(Activity)
skim_without_charts(Activity)
# finding missing value
Activity %>% 
  skim() %>%
  filter(n_missing > 0) # Not found

Calories %>% 
  skim() %>%
  filter(n_missing > 0) # Not found

Intensities %>% 
  skim() %>%
  filter(n_missing > 0) # Not found

Heartrate %>% 
  skim() %>%
  filter(n_missing > 0) # Not found

Sleep %>% 
  skim() %>%
  filter(n_missing > 0) # Not found

New_Weight <- Weight %>% 
  skim() %>%
  filter(n_missing > 0)  # Found total 65, which is many so delete this column



# Getting to know your data and clean column names

skim_without_charts(Activity)
Activity_new <- Activity 
clean_names(Activity_new)
view(Activity_new)

skim_without_charts(Calories)
Calories_new <- Calories
clean_names(Calories_new)

skim_without_charts(Intensities)
Intensities_new <- Intensities
clean_names(Intensities_new)

skim_without_charts(Heartrate)
Heartrate_new <- Heartrate
clean_names(Heartrate_new)

skim_without_charts(Sleep)
Sleep_new <- Sleep
clean_names(Sleep_new)
view(Sleep_new)

skim_without_charts(Weight)
Weight_new <- Weight
clean_names(Weight_new)

# find duplicate
duplicated(Activity_new)

duplicated(Calories_new)

duplicated(Intensities_new)

duplicated(Heartrate_new)

duplicated(Sleep_new) # found 3 duplicate
Sleep_new <- unique(Sleep_new) # remove duplicates
duplicated(Sleep_new)


duplicated(Weight_new)

#Organizing data

## count the number of NA values  

sum(is.na(Activity_new))
sum(is.na(Calories_new))
sum(is.na(Intensities_new))
sum(is.na(Heartrate_new))
sum(is.na(Sleep_new))
sum(is.na(Weight_new))# Found 65 values
Weight_new <- select(Weight_new, -Fat) #remove the column
view(Weight_new)

# trash, no need, just for trying
grepl("^\\s*$", Activity)
grepl("^\\s*$", Calories)
grepl("^\\s*$", Intensities)

countif(lapply(Activity, gsub, pattern="^\\s*$", replacement=""))

trimws(Activity)

# Date formatting

# Convert character data to date and time
Activity_new$ActivityDate=as.POSIXct(Activity_new$ActivityDate, format="%m/%d/%Y", tz=Sys.timezone())

# setting format to specify the style
Activity_new$date <- format(Activity_new$ActivityDate, format = "%m/%d/%y")

# convert column to date class using as.date method/ save date in date format
Activity_new$ActivityDate=as.Date(Activity_new$ActivityDate, format="%m/%d/%Y", tz=Sys.timezone())

# convert column to date class using as.date method and split to date
Activity_new$date=as.Date(Activity_new$date, format="%m/%d/%Y")
View(Activity_new)



Intensities_new$ActivityDay=as.Date(Intensities_new$ActivityDay, format="%m/%d/%Y", tz=Sys.timezone())
View(Intensities_new)



Sleep_new$SleepDay=as.POSIXct(Sleep_new$SleepDay, format="%m/%d/%Y %I:%M:%S %p", tz=Sys.timezone())
Sleep_new$date <- format(Sleep_new$SleepDay, format = "%m/%d/%y")
Sleep_new$date=as.Date(Sleep_new$date, "% m/% d/% y")
View(Sleep_new)


# data type change

# Change the data type of Id (numeric) to Character

# Activity_new <- Activity 
Activity_new$Id = as.character(Activity_new$Id)
str(Activity_new)
view(Activity_new)

# Intensities_new <- Intensities
Intensities_new$Id = as.character(Intensities_new$Id)
str(Intensities_new)
view(Intensities_new)


Weight_new$Id = as.character(Weight_new$Id)
view(Weight_new)
str(Weight_new)

Sleep_new$Id = as.character(Sleep_new$Id)
str(Sleep_new)


#Heartrate_new <- Heartrate
Heartrate_new$Id = as.character(Heartrate_new$Id)
str(Heartrate_new)
View(Heartrate_new)

# Calories_new <- Calories
Calories_new$Id = as.character(Calories_new$Id)
str(Calories_new)
View(Calories_new)


#id length check

id_lens <- nchar(Activity_new$Id)  # Count Id lengths
id_lens_bool <- id_lens == 10      # True/False check if id == 10 or not
stopifnot(id_lens_bool)           # This function will show Error if not all TRUE

# Since the function is not showing any errors, all ID lengths = 10

id_lens <- nchar(Intensities_new$Id)  
id_lens_bool <- id_lens == 10      
stopifnot(id_lens_bool)   

id_lens <- nchar(Calories_new$Id)  
id_lens_bool <- id_lens == 10      
stopifnot(id_lens_bool)

id_lens <- nchar(Heartrate_new$Id)  
id_lens_bool <- id_lens == 10      
stopifnot(id_lens_bool)

id_lens <- nchar(Sleep_new$Id)  
id_lens_bool <- id_lens == 10      
stopifnot(id_lens_bool)

id_lens <- nchar(Weight_new$Id)  
id_lens_bool <- id_lens == 10      
stopifnot(id_lens_bool)



# Analyze Phase .........................
# Summarizing the datasets


# Participants
require(dplyr)
Activity_new %>%
  summarize (Activity_participants = n_distinct(Activity_new$Id)) # 33

n_distinct(Calories_new$Id)      # 33
n_distinct(Intensities_new$Id)   # 33
n_distinct(Heartrate_new$Id)     # 14
n_distinct(Sleep_new$Id)         # 24
n_distinct(Weight_new$Id)        # 8
#So,I will focus on these datasets for my analysis: 
#Activity, Calories, Intensities and Sleep

##How many observations are there in each dataframe?

#r observations
nrow(Activity_new)
nrow(Calories_new)
nrow(Intensities_new)
nrow(Sleep_new)
nrow(Heartrate_new)
nrow(Weight_new)


# Quick summary statistics

# Activity
Activity_new %>%  
  select(TotalSteps,
         TotalDistance,
         VeryActiveMinutes,
         SedentaryMinutes, Calories) %>%
  summary()

# Explore number of active minutes per category
Intensities %>%
  select(VeryActiveMinutes,
         FairlyActiveMinutes,
         LightlyActiveMinutes, 
         SedentaryMinutes) %>%
  summary()

# Calories
Calories %>%
  select(Calories) %>%
  summary()

# Sleep
Sleep %>%
  select(TotalSleepRecords, 
         TotalMinutesAsleep, 
         TotalTimeInBed) %>%
  summary()

# Weight
Weight %>%
  select(WeightKg, BMI) %>%
  summary()


## KEY FINDINGS from this analysis(CREATE A TABLE) : ......................

## Average total steps per day (which is 7638) is a little bit less than recommended by the CDC. 
#According to the CDC research, taking 8,000 steps per day was associated with a 51% lower risk 
#for all-cause mortality (or death from all causes). Taking 12,000 steps per day was 
#associated with a 65% lower risk compared with taking 4,000 steps.

## The average sedentary time is too high which is more than 16 hours.

## Average Calorie is little bit higher . Recommended daily calorie intakes in the US are 
#around 2500 per day for men and 2000 for women.

## The majority of the participants are lightly active with a high sedentary time.

## Participants sleep 1 time for an average of almost 7 hours.

## Participants spend more time in bed than total minutes asleep, on average. 




## PLOTTING a few explorations..............
# Share and Act Phases :
#............................................

## Data visualization

## For Activity_new:
#Relationship between Steps and Sedentary time
require(ggplot2)
ggplot(data=Activity_new) + 
  geom_jitter(mapping=aes(x=TotalSteps, y=SedentaryMinutes),color="red") + 
  geom_smooth(mapping=aes(x=TotalSteps, y=SedentaryMinutes)) + 
  labs(title="Total Steps vs. Sedentary Minutes")

# Correlation test

corr_Act1 <- cor.test(Activity_new$TotalSteps, Activity_new$SedentaryMinutes,
                      method = "pearson")

corr_Act1 # (-0.3274835)
# I can see here a negative correlation between Steps and Sedentary time.



#Relationship between Steps and Calories

ggplot(data=Activity_new) + 
  geom_jitter(mapping=aes(x=TotalSteps, y=Calories)) + 
  geom_smooth(mapping=aes(x=TotalSteps, y=Calories)) + 
  labs(title="Total Steps vs. Calories")

# Correlation test

corr_02 <- cor.test(Activity_new$TotalSteps, Activity_new$Calories,
                      method = "pearson")

corr_02 # (0.5915681)
# positive correlation between Total Steps and Calories


## For Intensity_new: (rejected)
#Relationship between Very Active time and Sedandary time

ggplot(data=Intensities_new) + 
  geom_jitter(mapping=aes(x=VeryActiveMinutes, y=SedentaryMinutes),color="red") + 
  geom_smooth(mapping=aes(x=VeryActiveMinutes, y=SedentaryMinutes)) + 
  labs(title="Very Active Minutes vs. Sedentary Minutes")

# negactive correlation -->

install.packages("ggpubr")
library("ggpubr")

corr_In <- cor.test(Intensities_new$VeryActiveMinutes, Intensities_new$SedentaryMinutes,
                    method = "pearson")

corr_In  # (-0.164671)


## For Sleep

# Relationship between Minutes Asleep and Time in Bed

ggplot(data = Sleep_new) + 
  geom_jitter(mapping=aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + 
  geom_smooth(mapping=aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + 
  labs(title="Minutes Asleep Vs. Time in Bed")

# correlation test
corr_Sleep <- cor.test(Sleep_new$TotalMinutesAsleep, Sleep_new$TotalTimeInBed,
                       method = "pearson")

corr_Sleep # (0.9304224) --> positive correlation



#..............................................
# Merging Some data :

# Activity and Sleep data merging (No use but add in notebook)

Combined_inner <- merge(Activity_new, Sleep_new, by="Id")
n_distinct(Combined_inner$Id)

# We should consider outer join because there are some participants who are excluded

Combined_outer <- merge(Activity_new, Sleep_new, by="Id", all = TRUE)
n_distinct(Combined_outer$Id)

View(Combined_outer)

###### extra
calories_distance_sleep_point <- ggplot(Combined_outer) + 
  geom_point(mapping=aes(x=Calories, y=TotalDistance, color=TotalMinutesAsleep)) +
  labs(title="Calories vs. Distance vs. Total Minutes Asleep")

calories_distance_sleep_point + scale_color_gradientn(colours = rainbow(5))
#This plot also illustrates the positive correlation between total distance and
#calories. In other words, the more distance traveled, the more calories 
#expended.

#### check the percentage of sleep of participants(sleep kom calorie barbe cz of
    # junk food craving)


## Correlation between Activity and Sleep Variables

data <- Combined_outer
head(data)
write.csv(data, "C:\\Users\\User\\Desktop\\Portfolio Materials\\Fitbit_Fitness_Tracker_Data_20211222v01\\Activity_and_Sleep.csv", row.names = FALSE)

Activity_Sleep_data <- read.csv("C:\\Users\\User\\Desktop\\Portfolio Materials\\Fitbit_Fitness_Tracker_Data_20211222v01\\Activity_and_Sleep.csv")

head(Activity_Sleep_data)


Activity_Sleep_data <- Activity_Sleep_data  %>% select(-date.y)
Activity_Sleep_data <- Activity_Sleep_data  %>% 
  select(-LoggedActivitiesDistance, -SedentaryActiveDistance, -date.x)


install.packages("metan")
library(metan)
library(dplyr)

no_na_Activity_Sleep_data <- na.omit(Activity_Sleep_data)
cor(no_na_Activity_Sleep_data[sapply(no_na_Activity_Sleep_data, is.numeric)])
ASd_round <- no_na_Activity_Sleep_data %>% mutate_if(is.numeric,round)
corr <- corr_coef(ASd_round[, -1:-2])
plot(corr)


# Intensities and Sleep data merging (rejected)

Combined_IS <- merge(Intensities_new, Sleep_new, by="Id", all = TRUE)
n_distinct(Combined_IS$Id)


ggplot(data = Combined_IS) +
  geom_smooth(mapping = aes(x =SedentaryMinutes, y = TotalMinutesAsleep)) + 
  labs(title="Sedentary time Vs. Total Time In Bed")


corr_CIS <- cor.test(Combined_IS$LightlyActiveMinutes, Combined_IS$TotalMinutesAsleep,
                       method = "pearson")

corr_CIS

# Intensities and Weight data merging



Combined_IW <- merge(Intensities_new, Weight_new, by="Id", all = TRUE)
n_distinct(Combined_IW$Id)


Combined_IW$time <- format(Combined_IW$Date, format = "%H:%M:%S")

View(Combined_IW)

ggplot(Combined_IW) + 
  geom_bar(mapping = aes(x=time, y=VeryActiveMinutes), stat = "identity", fill="magenta")+
  theme(axis.text.x = element_text(angle = 90)) +
  labs(title="Total very Active Intensity vs. Time ") 
  
# Most users are active before and after work

######## extra.................
require(ggplot2)
ggplot(Combined_IW) +
  geom_jitter(mapping=aes(x=SedentaryMinutes, y=BMI)) + 
  geom_smooth(mapping=aes(x=SedentaryMinutes, y=BMI), method = 'loess', formula = 'y~x') + 
  labs(title="Sedentary time vs. BMI")
  

corr_CIW <- cor.test(Combined_IW$SedentaryMinutes, Combined_IW$BMI,
                       method = "pearson")

corr_CIW  # (0.3594792 ) Low positive correlation

ggplot(Combined_outer, aes(x=Calories)) +
  geom_histogram(binwidth = 250, color = "black", fill = "red") +
  labs(title="Total Calories Expended")

# weekdays vs. active, light, fair, sedentary

# time of different activity types ( Activity new)

Activity_new$WeekDay <- weekdays(Activity_new$ActivityDate)
install.packages("formattable")
library("formattable")

Activity_new$SedentaryMinutes_percent <- Activity_new$SedentaryMinutes

percent(Activity_new$SedentaryMinutes_percent)


library(dplyr)
Activity_new %>%
  group_by(WeekDay) %>%   
  summarise(percent = 100 * n()/ nrow(SedentaryMinutes))
head(Activity_new)

ggplot(data = Activity_new) +
  
## another one .......... (keep this one and not the upper one)

df <- Activity_new %>% 
  select(ActivityDate,
         VeryActiveMinutes,
         FairlyActiveMinutes,
         LightlyActiveMinutes,
         SedentaryMinutes) 
head(df)

df$WeekDay <- weekdays(df$ActivityDate)
df$WeekDay <- factor(df$WeekDay, levels = c("Sunday", "Monday", "Tuesday",
                                                 "Wednesday", "Thursday", "Friday",
                                                 "Saturday"))

df[order(df$WeekDay), ]


df$VeryActiveHours <- (df$VeryActiveMinutes)/60
df$FairlyActiveHours <- (df$FairlyActiveMinutes)/60
df$LightlyActiveHours <- (df$LightlyActiveMinutes)/60
df$SedentaryHours <- (df$SedentaryMinutes)/60


df <- df %>% select(-ActivityDate)
df <- df %>% select(-VeryActiveMinutes,
                    -FairlyActiveMinutes,
                    -LightlyActiveMinutes,
                    -SedentaryMinutes)

head(df)
View(df)

library(tidyr)
library(ggplot2)

ggplot(data = df %>% gather(Variable, Hours, -WeekDay),
       aes(x = WeekDay, y = Hours*100, fill = Variable)) +
  geom_bar(stat = 'identity', position = 'dodge') + 
  scale_y_continuous(breaks = scales :: pretty_breaks(n=10))
  
  
# + scale_y_continuous(limits = c(0,100))
#ylim(0, 1400) 

# extra:
df05 <- df %>%
  select(WeekDay, VeryActiveHours, FairlyActiveHours,
         LightlyActiveHours, SedentaryHours) %>%
  group_by(WeekDay) %>% 
  summarize(sum_SedentaryHours = sum(SedentaryHours),
            sum_VeryActiveHours = sum(VeryActiveHours),
            sum_FairlyActiveHours = sum(FairlyActiveHours),
            sum_LightlyActiveHours = sum(LightlyActiveHours))


View(df05)

library(tidyr)
library(ggplot2)
ggplot(data = df05 %>% gather(Variable, Hours, -WeekDay),
       aes(x = WeekDay, y = Hours, fill = Variable)) +
  geom_bar(stat = 'identity', position ='dodge') + 
  geom_text(aes(label=round(Hours, digits = 2)), 
            position = position_dodge(width = 0.9), vjust=-0.25, size=3)+
  scale_y_continuous(breaks = scales :: pretty_breaks(n=10)) + 
  labs(title="Activity and Sedentary Hours from Monday to Sunday")

# ...............................................

# Correlation between activity and sleep variables

install.packages("ggcorrplot") #..........(rejected)
library(ggcorrplot)


#data(Combined_outer)

install.packages("viridis")

library(ggplot2)
library(reshape2)
library(viridisLite)

df1 <- cor(Combined_outer[sapply(Combined_outer, is.numeric)])

df2 <- melt(df1, na.rm = FALSE)

head(df2)

ggplot(df2, aes(x = Var1, y = Var2, fill = value))+ geom_tile()
  geom_tile() + scale_fill_viridis(discrete = FALSE)

# install.packages("ggcorrplot") .... not working

# Install
if(!require(devtools)) install.packages("devtools")
devtools::install_github("kassambara/ggcorrplot")

library(ggcorrplot)
require(ggplot2)

install.packages(c("cluster.datasets"), dependencies = TRUE)
library(cluster.datasets)
library(ggcorrplot)
        
dat <- read.csv("Combined_outer.csv")

data(Activity_Sleep_data)
cor(AS[sapply(AS, is.numeric)])
corr <- round(cor(AS), 1)
head(corr[, 1:6])

ggcorrplot(Activity_Sleep_data, hc.order = TRUE, type = "lower", hc.method = "complete",
           outline.col = "white",
           ggtheme = ggplot2::theme_gray,
           colors = c("#6D9EC1", "white", "#E46726"),
           lab = TRUE)

#Again

require(ggplot2)

# Installing and loading the ggcorrplot package
install.packages("ggcorrplot")
library(ggcorrplot)

# Reading the data
data(Combined_outer)

# Computing correlation matrix
correlation_matrix <- round(cor(df),1)

head(correlation_matrix[, 1:4])

# Computing correlation matrix with p-values
corrp.mat <- cor_pmat(USArrests)

head(corrp.mat[, 1:4])

write.csv(Combined_outer, "/Combined_outer.csv")

install.packages("metan")
library(metan)
no_na_Activity_and_Sleep <- na.omit(Activity_and_Sleep)
cor(no_na_Activity_and_Sleep[sapply(AS, is.numeric)])
corr_2 <- corr_coef(no_na_Activity_and_Sleep[, -1:-2])
plot(corr_2)


Activity_and_Sleep <- merge(Activity_new, Sleep_new, by="Id", all = TRUE)
# upeer portion rejected
#...........(taken, accepted)
data <- Combined_outer
head(data)
write.csv(data, "C:\\Users\\User\\Desktop\\Portfolio Materials\\Fitbit_Fitness_Tracker_Data_20211222v01\\Activity_and_Sleep.csv", row.names = FALSE)

Activity_Sleep_data <- read.csv("C:\\Users\\User\\Desktop\\Portfolio Materials\\Fitbit_Fitness_Tracker_Data_20211222v01\\Activity_and_Sleep.csv")

head(Activity_Sleep_data)


Activity_Sleep_data <- Activity_Sleep_data  %>% select(-date.y)
Activity_Sleep_data <- Activity_Sleep_data  %>% 
  select(-LoggedActivitiesDistance, -SedentaryActiveDistance, -date.x)


install.packages("metan")
library(metan)
library(dplyr)

no_na_Activity_Sleep_data <- na.omit(Activity_Sleep_data)
cor(no_na_Activity_Sleep_data[sapply(no_na_Activity_Sleep_data, is.numeric)])
ASd_round <- no_na_Activity_Sleep_data %>% mutate_if(is.numeric,round)
corr <- corr_coef(ASd_round[, -1:-2])
plot(corr)

df1 = Sleep_new
table(df1$TotalMinutesAsleep <= 390)
num_row = nrow(Sleep_new)

print(sum(df1$TotalMinutesAsleep <= 390))

percent_Asleep <- (sum(df1$TotalMinutesAsleep <= 390) / nrow(Sleep_new))
percent_Asleep
library(formattable)
label_percent()(percent_Asleep)

