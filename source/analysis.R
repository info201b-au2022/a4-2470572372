library(tidyverse)

# The functions might be useful for A4
source("../source/a4-helpers.R")

## Test queries ----
#----------------------------------------------------------------------------#
# Simple queries for basic testing
#----------------------------------------------------------------------------#
# Return a simple string
test_query1 <- function() {
  return ("Hello world")
}

# Return a vector of numbers
test_query2 <- function(num=6) {
  v <- seq(1:num)
  return(v)
}

## Section 2  ---- 
#----------------------------------------------------------------------------#
# total number of incarcerated 
sum(incarceration_trends$total_jail_pop)

#percentage of incarcerated by race
#black
sum(incarceration_trends$black_jail_pop, na.rm = TRUE)/sum(incarceration_trends$total_jail_pop, na.rm =TRUE)*100
#latinx
sum(incarceration_trends$latinx_jail_pop, na.rm = TRUE)/sum(incarceration_trends$total_jail_pop, na.rm = TRUE)*100
# percentage by gender
sum(incarceration_trends$female_jail_pop, na.rm = TRUE)/sum(incarceration_trends$total_jail_pop, na.rm = TRUE)*100
#----------------------------------------------------------------------------#

## Section 3  ---- 
#----------------------------------------------------------------------------#
# Growth of the U.S. Prison Population
Growth1<-ggplot(incarceration_trends, aes(x = year, y = total_jail_pop))+ 
  geom_bar(stat = "identity") +
  xlab("Year") + 
  ylab("Total Jail Population") +
  ggtitle("Growth of the U.S. Prison Population") +
  labs(caption = "figure 1.Growth of Jail Population in U.S.(1970-2018)")
#----------------------------------------------------------------------------#
# This function ... <todo:  update comment>
get_year_jail_pop <- function() {
  # TODO: Implement this function 
  return()   
}

# This function ... <todo:  update comment>
plot_jail_pop_for_us <- function()  {
  # TODO: Implement this function 
  return()   
} 

## Section 4  ---- 
#----------------------------------------------------------------------------#
# Growth of Prison Population by State 
library(dplyr)
jail_pop_5 <- incarceration_trends %>%
  filter(state %in% c("WA", "OR", "CA", "AL", "KS"))

# plot the data
Growth2<-jail_pop_5 %>%
  ggplot(aes(x = year, y = total_jail_pop, color = state)) +
  geom_smooth() +
  xlab("Year") +
  ylab("Total Jail Population") +
  ggtitle("Growth of Prison Population by State") +
  labs(caption = "figure 2. Growth of Prison Population by State")
#----------------------------------------------------------------------------#

## Section 5  ---- 
#----------------------------------------------------------------------------#
# <variable comparison that reveals potential patterns of inequality>
jail_pop_county <- incarceration_trends %>%
  filter(county_name %in% c("Autauga County", "Baldwin County", "Jefferson County", "Woodford County", "Decatur County", "Worth County"))

# plot the data
Female_inequality<-jail_pop_county %>%
  ggplot(aes(x = year, y = female_jail_pop, color = county_name)) +
  geom_smooth() +
  xlab("Year") +
  ylab("Female Jail Population") +
  ggtitle("Female Jail Population by County") +
  labs(caption = "figure 3. Inequality of female jail population by county")

# plot the data
Male_inequality<-jail_pop_county %>%
  ggplot(aes(x = year, y = male_jail_pop, color = county_name)) +
  geom_smooth() +
  xlab("Year") +
  ylab("Male Jail Population") +
  ggtitle("Male Jail Population by County") +
  labs(caption = "figure 4. Inequality of male jail population by county")
#----------------------------------------------------------------------------#

## Section 6  ---- 
#----------------------------------------------------------------------------#
# <a map shows potential patterns of inequality that vary geographically>
jail_pop_state <- incarceration_trends %>%
  filter(county_name %in% c("Autauga County", "Baldwin County", "Jefferson County", "Woodford County", "Decatur County", "Worth County"))
# plot the data
Map<-jail_pop_state %>%
  ggplot(aes(x=year, y=total_jail_pop, colour = county_name)) +
  geom_polygon() +
  xlab("Year") + 
  ylab("Total Jail Population") +
  ggtitle("Variation of Jail Population by County") +
  scale_fill_continuous(low = "white", high = "red") +
  labs(caption = "figure 5. maps showing Inequality of total jail population by county")
#----------------------------------------------------------------------------#

## Load data frame ---- 
library(readxl)
incarceration_trends <- read_excel("incarceration_trends.xlsx")