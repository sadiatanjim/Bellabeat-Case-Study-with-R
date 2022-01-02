# Bellabeat-Case-Study-with-R
This is a case study performed for Bellabeat Ltd. on the Fitbit Fitness Tracker Dataset with R. This project has been performed as the Capstone Project for Google Data Analytics Professional Certificate. 

## Dataset: 
[Fitbit Fitness Tracker Dataset](https://www.kaggle.com/arashnic/fitbit)

## Full Report:
To see the full Report on the Case Study, please click [Here](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/05c8d4ecb4d5e48d8f27cd776c1a543e33845d9a/pdf/Bellabeat-Case-Study-with-R.pdf)

# Case Study:

## KEY FINDINGS from this analysis: 

* Average total steps per day (which is 7638) is a little bit less than recommended by the CDC (8000). 
* The average sedentary time is very high (more than 16 hours).
* Average Calorie is little bit higher . Recommended daily calorie intakes in the US are around 2500 per day for men and 2000 for women.
* The majority of the participants are lightly active with a high sedentary time.
* Participants spend more time in bed than total minutes asleep, on average.

## Correlation Analysis:

### Total Steps Vs. Sedentary Minutes
We can see a negative correlation between Total Steps and Sedentary Minutes. It is evident that people logging more sedentary time are less likely to take part in physical activity like walking. 

![Total Steps vs. Sedentary Minutes](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/ea79466d659fce86f80364c10cb9bfc20dd86db5/img/stepsVmins.jpg)

### Total Steps vs. Calories
We can see a positive correlation between total steps and calories burned. It is evident that people logging in more steps are physically more active hence they are able to burn more calories everyday. 
![Total Steps vs. Calories](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/385d7ac84112cdc02d7e3b9c851f29f4cf887610/img/stepsVcals.jpg)

### Minutes Asleep vs. Time in Bed
Participants spend more time in bed than actual time asleep. Sleep quality and sleeping habits are not ideal.
![Minutes Asleep vs. Time in Bed](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/385d7ac84112cdc02d7e3b9c851f29f4cf887610/img/minsInbed.jpg)
I can see a strong positive correlation between total minutes asleep and total time in bed.

### Calories vs. Distance vs. Total Minutes Asleep

Based on this plot, we can determine that even after long distances and calories expended, the average amount of sleep ranges from 6 - 8 hours. There were hits of red and orange, but I do think these were recorded in error. However, it is possible some individuals stayed up most of the night and only slept for a couple hours or they might have only tracked themselves taking short naps.
![Calories vs. Distance vs. Total Minutes Asleep](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/385d7ac84112cdc02d7e3b9c851f29f4cf887610/img/calVdistVmins.jpg)

This plot also illustrates the positive correlation between total distance and calories. In other words, the more distance traveled, the more calories expended.
We can also see the overall trend that the people with more distance/calories expended are able to spend more time asleep. 

## Correlation Matrix
![Correlation Matrix](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/385d7ac84112cdc02d7e3b9c851f29f4cf887610/img/corr-matrix.jpg)

From the above correlation matrix, we can see a strong correlation between the following metrics which are relevant: 

* Positive relationship between Calories & Very Active Minutes
* Negative relationship between lightly active minutes & Sedentary Minutes
* Positive relationship between total steps & lightly active minutes/distance, fairly active minutes/distance
* Positive relationship between very active minutes & total distance

We can identify different trends and user behavior relating to the metrics like calories, steps, and distance etc. from the above correlation matrix. 

## Tracked Hours throuhout the Week

![Tracked Hours throughout the week](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/385d7ac84112cdc02d7e3b9c851f29f4cf887610/img/trackedHrs.jpg)
The average user spends a lot of sedentary time.The number of sedentary hours is lower during the weekends and at the start of the week. However, it sees an increasing trend during the middle of the week for example during Tuesday/Wednesday/Thursday. This might be due to work stress or users simply forgetting to workout.The users active time is also not consistent throughout the week. Bellabeat users might be encouraged to track their active/sedentary hours throughout the the week and reminded to take some time to relieve stress and encourage some light activity mid-week. 


## Conclusions & Recommandations for the Business

So, collecting data on activity, sleep, stress, etc. will allow the company Bellabeat to empower the customers with knowledge about their own health and daily habits. The company Bellabeat is growing rapidly and quickly positioned itself as a tech-driven wellness company for their customers.

We have performed a detailed analysis on different data points of the FitBit Fitness Tracker Dataset. The studied data points include activity, sleep, stress, calorie intake/expenditure, and daily habits, etc. This analysis provides some valuable insights about the fitness level and health of the users in relation to different daily habits and lifestyle practices. Some key findings from the analysis are presented below:

**Activity Level:**  The majority of participants are lightly active with high sedentary time. 

**Step Count:** A significant data point to determine user activity is the number of steps taken each day by a given user. We can see that the average user takes a total of 7638 steps each day. 

**Sedentary Time:** It can be seen from the data that the average user spends almost 16 hours a day of Sedentary time which is not a healthy practice. 

**Sleep:** Participants spend more time in bed than actual time asleep. Sleep quality and sleeping habits are not ideal.

**Activity Throughout the Week:** We analyzed the users’ activity level i.e. sedentary time, activity level (intenser/moderate/light) throughout the week with respect to the day of the week i.e. Monday/Tuesday etc. 
We can see that … (copy and paste findings here again)

**Correlation Study:** 

* *Total Steps vs. Sedentary Minutes:* We can see a negative correlation between the total steps and sedentary minutes. This suggests a general trend that the less active people i.e. the people with fewer steps per day spend more sedentary time.  

* *Total Steps vs. Calories:* We can see a positive correlation between the total steps and calories burnt. This suggests that more activity is related to more calories expended. 

* *Relationship Between Calories, Distance, and Total Minutes Asleep:* From the Calories vs. Distance vs. Total minutes asleep plot we can see that there is a positive correlation with calories with both distance covered each day and total minutes asleep. This suggests that the more distance a person covers, he/she is more likely to spend more time asleep and also more calories burned, which should be beneficial for health. 


### Target Audience :
From the analysis of the dataset, we can identify certain groups of people who could benefit from fitness tracking/lifestyle improvements. These are people with - 

* Low level of physical activity
* High level of sedentary time
* Low step count per day and less average distance covered each day
* Low caloric expenditure
* Inadequate amount of sleep/poor sleeping habits, etc.

People with this sort of lifestyle are most likely people with full-time jobs spending a lot of time at the computer or office workers with low levels of physical exercise and a lack of healthy habits, etc. It is recommended that Bellabeat might focus on people with these certain characteristics as a target audience who could benefit from using fitness-tracking smart devices. For example office workers and sedentary workers. 


### Message to the Company :

After a thorough analysis of the dataset, we are able to identify various trends in user behavior relevant to their fitness, health, and lifestyle. These general trends might be useful to make strategic decisions for Bellabeat’s smart devices. 

|   Trend   | Feature Recommendations |
|-----------|-------------------------|
|The average daily step count (7638) is less than recommended by CDC (8000)|Bellabeat smart devices should track user steps throughout the day and send users daily reminders, and weekly reports about their daily step target.|
|The average user spends more than 16 hours of sedentary time per day.|Bellabeat smart devices should track users’ sedentary time and send push notifications for users whenever they are spending too much sedentary time. It should also send users reminders to perform some light activity according to their physical activity level.|
|Inconsistent level of activity throughout the week|If we take a look a the trends of active hours, they are the highest at the start of the week but gradually drop-off. Bellabeat customers might be encouraged to maintain consistency throughout the week with regular updates and reminders. We can provide users with customized reports on their weekly activities so that they can work on improving their schedules.|
|Unhealthy sleeping habits|Bellabeat smart devices should be able to track and monitor sleep quality and sleep activity. Bellabeat devices should be able to help users develop better sleeping habits through the following features - notifications and reminders for getting to bed on time and waking up on time, reminders to stay away from artificial light before bedtime, reports, and suggestions to develop better sleeping habits.|
|Positive correlation between total steps and sedentary minutes|Users with higher sedentary time should be suggested to walk more steps with reminders/push notifications.|
|Correlation between total steps and calories expended (positive)|A linear relationship has been developed between the total steps and calories expended. We can use this data to interpolate activity targets for people looking to hit a specific calorie-burning target. For example, if a person wants to burn 2000 calories a day he/she can set a target of 5000 steps/day. Again, if a person wants to burn 2500 calories a day, he/she can be suggested to take 10000 steps a day, and so on.|
|Relationship between Calories, Distance, and Sleep|Users looking forward to developing better sleeping habits and calorie expenditure might be suggested daily distance targets to better improve their health and fitness.|

### Recommendations to the Bellabeat Marketing team :

In light of the above findings and recommendations, the Bellabeat marketing team might be able to take some strategic decisions regarding the following fields: 

* Target Audience:
  * Office workers and people with work of sedentary nature
  * Users who could benefit from a healthier lifestyle

* Bellabeat Smart Device Hardware Feature Recommendations
  * Activity Tracking
  * Sleep Tracking
  * Step Counting
  * Distance Tracking

* Bellabeat Smart Application Software Feature Recommendations
  * Push notifications/reminders to workout/exercise
  * Alerts for users with high sedentary status
  * Customized step/distance goals
  * Sleep Alerts
  * Daily/Weekly report and summary statistics for different activities/metrics i.e. Sleep, Steps, Distance, Calories, etc. 
  * Lifestyle recommendations

## References :

* " CDC - Higher Daily Step Count Linked with Lower All-cause Mortality - CDC Newsroom." Centers for Disease Control and Prevention, 24 Mar. 2020, 
https://www.cdc.gov/media/releases/2020/p0324-daily-step-count.html

* "CDC — How Much Sleep Do I Need? — Sleep and Sleep Disorders." Centers for Disease Control and Prevention, 2 Mar. 2017, https://www.cdc.gov/sleep/about_sleep/how_much_sleep.html

* "Weight Loss: How Many Calories Can Walking 10,000 Steps Burn? - Lifestyle News." The Times of India, Last updated on - Jan 26, 2021,
https://m.timesofindia.com/life-style/health-fitness/fitness/weight-loss-how-many-calories-can-walking-10000-steps-burn/amp_etphotostory/80452318.cms

* “The Dangers of Sitting: Why Sitting Is the New Smoking.” The Dangers of Sitting: Why Sitting Is the New Smoking — Better Health Channel, 22 Aug. 2020, https://www.betterhealth.vic.gov.au/health/healthyliving/the-dangers-of-sitting

* Nield, David. “Scientists Figured out How Much Exercise You Need to ‘Offset’ a Day of Sitting.” ScienceAlert, 26 Nov. 2020, https://www.sciencealert.com/getting-a-sweat-on-for-30-40-minutes-could-offset-a-day-of-sitting-down

* “How Much Physical Activity Do Adults Need?” Centers for Disease Control and Prevention, Centers for Disease Control and Prevention, 7 Oct. 2020, https://www.cdc.gov/physicalactivity/basics/adults/index.htm

## Full Report:
To see the full Report on the Case Study, please click [Here](https://github.com/sadiatanjim/Bellabeat-Case-Study-with-R/blob/05c8d4ecb4d5e48d8f27cd776c1a543e33845d9a/pdf/Bellabeat-Case-Study-with-R.pdf)
