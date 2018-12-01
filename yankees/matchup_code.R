library(dplyr)

matchups <- read.csv("matchupdata.csv")

batters <- matchups %>% 
  group_by(batterID) %>%
  summarize(avg=mean(Result), total=300*mean(Result))

pitchers <- matchups %>% 
  group_by(pitcherID) %>%
  summarize(avg=mean(Result))

scaled.result <- c()
for (i in 1:length(matchups$batterID)) {
  id <- matchups$batterID[i]
  scaled.avg <- scale(batters$avg)[id]
  scaled.result[i] <- matchups$Result[i] - scaled.avg
}

matchups <- cbind(matchups, scaled.result)

scaled.pitchers <- matchups %>% 
  group_by(pitcherID) %>%
  summarize(avg=mean(scaled.result))

scaled.results <- c()
for (i in 1:length(matchups$pitcherID)) {
  id <- matchups$pitcherID[i] - 100
  scaled.avg <- scale(scaled.pitchers$avg)[id]
  scaled.results[i] <- matchups$scaled.result[i] + scaled.avg
}

matchups <- cbind(matchups, scaled.results)

scaled.batters <- matchups %>% 
  group_by(batterID) %>%
  summarize(scaled.avg=mean(scaled.results), scaled.total=300*mean(scaled.results))

projections <- cbind(batters, scaled.batters)[-4]

write.csv(projections, 'projections.csv')