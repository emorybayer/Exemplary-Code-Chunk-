load("ssa_water.Rdata")
New_set <- water %>%
  group_by(countryModule) %>%
  summarize(
    N = n(),
    Year = first(interviewYear),
    Walk_time_Mean = mean(waterTimeMins, na.rm = TRUE),
    SD_Walk_time = sd(waterTimeMins, na.rm = TRUE),
    Median_Walk_time = median(waterTimeMins, na.rm = TRUE),
    Percent_on_plot = (sum(waterTimeMins == 0, na.rm = TRUE) / N * 100)
  )

sum(New_set$N)
mean(New_set$Walk_time_Mean)
mean(New_set$SD_Walk_time)
mean(New_set$Median_Walk_time)
mean(New_set$Percent_on_plot)

new_row = data.frame(
  countryModule = c("Total"),
  N = 623926,
  Year = NA,
  Walk_time_Mean = 22.92044,
  SD_Walk_time = 32.25327,
  Median_Walk_time = 12.82143,
  Percent_on_plot = 23.78786
)

New_new = rbind(New_set, new_row) %>%
  rename( country = countryModule,
          year = Year,
          mean = Walk_time_Mean,
          SD = SD_Walk_time,
          med = Median_Walk_time,
          `% on plot`= Percent_on_plot) 

kable(New_new) 
#%>% add_header_above(header = c(" " = 3, "walk time (min)" = 3, " " = 1))