mySpec <- hmm(
  K = 3, R = 1,
  observation = Binomial(
    theta = Beta(alpha = 0.5, beta = 0.5, bounds = list(0, 1)),
    N     = 100
  ),
  initial     = Dirichlet(alpha = c(0.5, 0.5, 0.5)),
  transition  = Dirichlet(alpha = c(0.5, 0.5, 0.5)),
  name = "My binomial model!..."
)

set.seed(9000)
y = as.matrix(
  c(rbinom(100, 100, 0.5), rbinom(100, 100, 0.2), rbinom(100, 100, 0.8))
)

myFit <- fit(mySpec, y = y, chains = 1, iter = 500, seed = 9000)

plot_obs(myFit)

print_all(myFit)
