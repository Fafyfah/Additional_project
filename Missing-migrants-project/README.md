# Global Missing Migrants Project

### Global Missing Migrants Dashboard can be accessed with this [link](https://public.tableau.com/views/Draft_dashboard/Exploratory?:language=en-US&:display_count=n&:origin=viz_share_link) 

### Below is the report for this project :point_down:

## Introduction

Migration is a fundamental facet of interconnected globalized world. People have been on move since in the past, though, many individuals are compelled to migrates due to dire circumstances such as internal conflicts, human rights violations, and more. Nowadays, migration has become a global issue, characterized by large-scale movements of refugee and migrants across the world, accompanied by a number of deaths and disappearances during these journeys[^1]. According to Missing Migrants project, which is initiated by IOM, the deaths of more than 50,000 migrants has been recorded since 2014 with the remains of over 24,835 individuals who lost their lives during migration not yet been recovered[^2]. Migrants’ journeys are often fraught with danger, they may risk losing contact with their families, falling victim to human trafficking, or enduring exploitation in informal labor arrangements. For that reason, the current migration situation is viewed to be urgent and the issue demands immediate attention to protect the right of migrants as their well-being are at risk.
 
Through making this project, I aim to explore the precarious situation faced by migrants, and shed a light on the severity of migrants' challenges they encountered during their journeys. In order to achieve this goal, I proceed to answer questions about the dataset. For example, the peak year in migrants’ death and missing, the leading cause of the deaths, the deadly migration route, the geographical regions of the migrant incidents recorded, and the origins of these migrants. The output of this project is an interactive data visualization dashboard consist of 6 charts and 1 interactive map, regarding aforementioned questions.

## Dataset
In this project, I use **Global Missing Migrants Dataset** posted by **NIDULA ELGIRIYEWITHANA** from [Kaggle](https://www.kaggle.com/datasets/nelgiriyewithana/global-missing-migrants-dataset). This dataset collected by the Missing Migrants Project by IOM since 2014. It provides a comprehensive record of missing migrants and their tragic journeys towards international destinations.

This data initially has 19 columns, including Incident Type, Incident Year, Reported Month, Region of Origin, Region of Incident, Country of Origin, Number of Dead, Minimum Estimated Number of Missing, Total Number of Dead and Missing, Number of Survivors, Number of Females, Number of Males, Number of Children, Cause of Death, Migration Route, Location of Death, Information Source, Coordinates, UNSD Geographical Grouping

The owner noted that due to the complexities of data collection, the number presented in the dataset are likely an undercount. According to Missing Migrants Project’s methodological framework, many migrant deaths and missing during migration are unrecorded. You can read more [here](https://missingmigrants.iom.int/methodology).

## Data preparation process

**Note**: You can access the workbook that shows data preparation process using Python/pandas with this [link]()

From examining the dataset, there are several columns that contained null values, including:

- Region of Origin: 22 null values
- Country of Origin: 8 null values
- Number of Dead: 550 null values
- Migration Route: 3,021 null values
- Information Source: 8 null values
- Coordinates: 36 null values
- UNSD Geographical Grouping: 1 null value

To address these missing values, a data cleaning process was conducted by using Python. Firstly, the null values in the "Number of Dead" column were replaced with 0 to preserve data integrity instead of dropping them. Next, the remaining variables namely "Region of Origin," "Country of Origin," and "Migration Route" were filled with “Unknown” to maintain data comprehensibility and highlight the challenges associated with collecting and identifying deceased and missing migrants. Lastly, the remaining null values in "Information Source," "Coordinates," and "UNSD Geographical Grouping" were dropped, totaling only 45 values removed.

During the dataset's descriptive statistics’ checking, incorrect values were also detected. The "Minimum Estimated Number of Missing" and "Survivors" columns, amounting 9 rows, had a minimum of -2. Such values were considered unlikely as negative counts for survivors are illogical. To maintain data integrity, these rows were subsequently removed. Consequently, the dataset was refined and contained 12,967 rows and 19 columns.

Lastly, recognizing the need for visualization using Tableau Public, an additional transformation was applied. The string variable "Coordinates" representing geographical incident locations, was modified to include separate columns for longitude and latitude. Consequently, the dataset was expanded to 21 columns and retained its 12,967 rows.

With the dataset now prepared, it’s ready for export and utilization within Tableau Public.

## Dashboard Explanation

Global missing migrants dashboard consisted of 3 pages: Exploratory, Year trend, and Map. Each page will be explained in order.

### Exploratory

The first page of dashboard serves as an exploratory page that allows users' interaction and dynamic exploration of the dataset. The following are all the elements on this page.

1. **Year Filter** : This interactive filter enables users to filter data by specific years for a more detailed examination. Users can focus on a particular year to gain insights or select *‘All’* to view aggregated data of all recorded years.
2. **Text boxes** : There are 3 text boxes in this page. The first box presents the total number of migrants recorded within the dataset, derived from the sum of ‘Total Number of Dead and Missing’ and ‘Number of Survivor’. The second box presents ‘Total Number of Dead and Missing,’ while the third box presents ‘Total Number of Dead and Missing’ as a percentage to provide a clearer perspective on the proportion of deceased and missing migrant cases. 
3. **Cause of death** : This bar chart demonstrates the various causes of death among the migrants. It was displayed as the largest and only vertical graph to emphasizes the main point of this project to present the challenges faced by migrants. The darker shades of the bars indicate the higher number of deaths. As shown in the chart, drowning is the primary cause of death. 
4. **Gender distribution** : This pie chart illustrates the gender distribution of deceased and missing migrants. The chart shows that the majority of deceased migrants are male, followed by an ‘unidentified’ category, indicating cases where gender identification is challenging.
5. **Region of origin** : This horizontal bar chart displays the Geographical regions where the deceased migrants originated. According to the chart, most of them have unknown or unidentified origin. 
6. **Region of incident** : This horizontal bar chart displays Geographical region where incidents involving migrants occurred. It's important to mention that the dimension used for this graph is ‘Count of the data recorded,’ or the number of rows of the dataset. The decision was made because this dimension provides a comprehensive overview of the region in which an incident took place.
7. **Deadly Migration Route** : This horizontal bar chart displays the migration routes taken by migrants during their journeys and resulted in numerous incidents and fatalities. The dimension for this chart is the 'Total Number of Dead and Missing,’ to highlight the danger associated with the migration route. The chart indicates that the Central Mediterranean route emerges as the most dangerous route.

### Year trend

The second page of the dashboard consisting of one primary chart and two accompanying text boxes. The followings are this page’s components:

1. **Main Chart - Survivor and Total Dead/Missing Trends:** This is a line chart that serves as a central element of the page and provides a comparative analysis of the trends in survivor numbers and the total number of dead and missing individuals over the years. This chart allows for a clear view of how these two metrics evolve over time. Based on the chart, the trends for the number of survivors and the total number of dead and missing people mirror one another, indicating a correlation in their fluctuations. Notably, the years 2016 and 2022 both have the high counts for number of survivors and the total number of dead and missing people. This observation potentially signifies a connection to a migration crisis during those specific years. However, more research are needed since the data is not sufficient to draw a definitive conclusion.
2. **Text Boxes - Survivor and Dead/Missing Percentages**: Complementing the main chart, two text boxes are positioned on the right side of the main chart. The first text box displays the percentage of survivors, while the second text box presents the percentage of dead and missing migrants. This presentation format is intentionally chosen for its ease of interpretation, to ensure that viewers can get a glimpse of the proportions of these metrics.

### Map

The third page, the last page of this dashboard, features **an interactive map** which serves as a dynamic visualization tool displaying the geographical locations of the incidents. This map uses bubble markers, and the size of each bubble shows the number of dead and missing migrants in each incident. This map aims to underline the real-world impact of these incidents and the migrants suffered. Despite maintaining the tone blue throughout the dashboard, I choose a green color to emphasize the geographical markers on the map. The use of color aim to enhance the visibility of these markers and make them easily noticeable. Moreover, the interactive nature of this map allows viewers to *zoom* in for a closer examination of the specific incidents and user can *point* to access additional details about them.

**Report hasn't finished yet!**

**References**
[^1]: [https://www.un.org/en/global-issues/migration](https://www.un.org/en/global-issues/migration)
[^2]: [https://missingmigrants.iom.int/data](https://missingmigrants.iom.int/data)
