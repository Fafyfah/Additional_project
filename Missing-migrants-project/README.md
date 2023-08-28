# Global Missing Migrants Project

### Global Missing Migrants Dashboard can be accessed with this [link](https://public.tableau.com/views/Draft_dashboard/Exploratory?:language=en-US&:display_count=n&:origin=viz_share_link) 

Migration is a fundamental facet of interconnected globalized world. People have been on move since in the past, though, many individuals are compelled to migrates due to dire circumstances such as internal conflicts, human rights violations, and more. Nowadays, migration has become a global issue, characterized by large-scale movements of refugee and migrants across the world, accompanied by a number of deaths and disappearances during these journeys[^1]. According to Missing Migrants project, which is initiated by IOM, the deaths of more than 50,000 migrants has been recorded since 2014 with the remains of over 24,835 individuals who lost their lives during migration not yet been recovered[^2]. Migrants’ journeys are often fraught with danger, they may risk losing contact with their families, falling victim to human trafficking, or enduring exploitation in informal labor arrangements. For that reason, the current migration situation is viewed to be urgent and the issue demands immediate attention to protect the right of migrants as their well-being are at risk.
 
Through making this project, I aim to explore the precarious situation faced by migrants, and shed a light on the severity of migrant issue and challenges they encounter during their journeys. In order to achieve this goal, I proceed to answer questions about the dataset. For example, the peak year in migrants’ death and missing, the leading cause of the deaths, the deadly migration route, the geographical regions of the migrant incidents recorded, and the origins of these migrants. The output of this project is an interactive data visualization dashboard consist of 6 charts and 1 interactive map, regarding aforementioned questions.

## Dataset
In this project, I use **Global Missing Migrants Dataset** posted by **NIDULA ELGIRIYEWITHANA** from [Kaggle](https://www.kaggle.com/datasets/nelgiriyewithana/global-missing-migrants-dataset). This dataset collected by the Missing Migrants Project by IOM since 2014. It provides a comprehensive record of missing migrants and their tragic journeys towards international destinations.

This data initially has 19 columns, including Incident Type, Incident Year, Reported Month, Region of Origin, Region of Incident, Country of Origin, Number of Dead, Minimum Estimated Number of Missing, Total Number of Dead and Missing, Number of Survivors, Number of Females, Number of Males, Number of Children, Cause of Death, Migration Route, Location of Death, Information Source, Coordinates, UNSD Geographical Grouping

The owner noted that due to the complexities of data collection, the number presented in the dataset are likely an undercount. According to Missing Migrants Project’s methodological framework, many migrant deaths and missing during migration are unrecorded. The fatalities often occur in remote areas, making it difficult to quickly locate bodies and report deaths systematically. Additionally, collecting data on migrant deaths and disappearances is further complicated by the scarcity of consistent reporting by states. You can read more [here](https://missingmigrants.iom.int/methodology).

## Data cleaning process

From examining the dataset, there are several columns that contained null values, including:

- Region of Origin: 22 null values
- Country of Origin: 8 null values
- Number of Dead: 550 null values
- Migration Route: 3,021 null values
- Information Source: 8 null values
- Coordinates: 36 null values
- UNSD Geographical Grouping: 1 null value

To address these missing values, a data cleaning process was conducted by using Python. Firstly, the null values in the "Number of Dead" column were replaced with 0 to preserve the integrity of the dataset instead of dropping them. Next, the remaining variables namely "Region of Origin," "Country of Origin," and "Migration Route" were filled with “Unknown” to maintain data comprehensibility and highlight the challenges associated with collecting and identifying deceased and missing migrants. Lastly, the remaining null values in "Information Source," "Coordinates," and "UNSD Geographical Grouping" were dropped, totaling only 45 values removed.

During the dataset's descriptive statistics’ checking, wrong values were also detected. The "Minimum Estimated Number of Missing" and "Survivors" columns, amounting 9 rows, had a minimum of -2. Such values were considered unlikely as negative counts for survivors are illogical. To maintain data integrity, these rows were subsequently removed. Consequently, the dataset was refined and contained 12,967 rows and 19 columns.

Lastly, recognizing the need for visualization using Tableau Public, an additional transformation was applied. The string variable "Coordinates," representing geographical incident locations, was modified to include separate columns for longitude and latitude. Consequently, the dataset was expanded to encompass 21 columns and retained its 12,967 rows.

With the dataset now prepared, it’s ready for export and utilization within Tableau Public, a powerful tool for creating data visualizations.

**Report hasn't finished yet!**

**References**
[^1]: [https://www.un.org/en/global-issues/migration](https://www.un.org/en/global-issues/migration)
[^2]: [https://missingmigrants.iom.int/data](https://missingmigrants.iom.int/data)
