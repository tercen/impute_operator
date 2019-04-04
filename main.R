library(tercen)
library(dplyr)

ctx = tercenCtx()

ctx %>% 
  select(.y, .ci, .ri) %>% 
  group_by(.ci, .ri) %>%
  mutate(impute = ifelse(is.na(.y), 0, mean(.y, na.rm = TRUE))) %>%
  ctx$addNamespace() %>%
  ctx$save()