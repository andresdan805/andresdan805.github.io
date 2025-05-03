y = c(1.64, 1.7, 1.72, 1.74, 1.82, 1.82, 1.9, 2.08)
n = length(y)

options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("cmdstanr", repos = c("https://mc-stan.org/r-packages/", getOption("repos")))
cmdstanr::install_cmdstan(check_toolchain=FALSE, overwrite=TRUE)
library(cmdstanr)
library(bayesplot)
library(rstan)
getwd()
#cmdstan_path()
#set_cmdstan_path("/Users/danielramos/.cmdstan/cmdstan-2.36.0")
stan_model <- cmdstan_model("example_stan.stan")
stan_fit <-
  stan_model$sample(
    data = list(N = n, y = y, k0=1),
    refresh = 0, show_messages=FALSE)

