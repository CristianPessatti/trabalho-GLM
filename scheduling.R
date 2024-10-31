require(tidyverse)
require(AppliedPredictiveModeling)

data(schedulingData)
schedulingData

dados_tratados <- schedulingData %>% 
  mutate(class = ifelse(Class %in% c("F", "VF"), 0, 1)) %>% 
  select(-Class)
