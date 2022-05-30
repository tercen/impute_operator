suppressPackageStartupMessages({
  library(tercen)
  library(tercenApi)
  library(tidyr)
  library(dplyr)
  library(dtplyr)
})

ctx <- tercenCtx()

method <- ctx$op.value("method", as.character, "mean_per_row")

df <- ctx %>% 
  select(.ri, .ci, .y) %>%
  dtplyr::lazy_dt() %>%
  complete(.ri, .ci)


if(method != "constant") {
  
  if(method == "mean_per_column") df <- df %>% group_by(.ci)
  if(method == "mean_per_row") df <- df %>% group_by(.ri)
  impute.mean <- function(x) replace(x, is.na(x), mean(x, na.rm = TRUE))
  
  df_out <- df %>% mutate(.y = impute.mean(.y)) %>% rename(imputed = .y)

} else {
  
  val <- ctx$op.value("value", as.double, 0)
  df_out <- df %>% replace_na(list(.y = val)) %>% rename(imputed = .y)
  
}

df_out <- df_out %>% as_tibble() %>%
  ctx$addNamespace()

df_out %>%
  ctx$save()

# build_test_data(df_out, ctx, test_name = "test", test_folder = "./tests")
