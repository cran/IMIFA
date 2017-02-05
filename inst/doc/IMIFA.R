## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(fig.width=7, fig.height = 5, fig.align = 'center', fig.show='hold',
                      warning=FALSE, message=FALSE, progress=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages('IMIFA')

## ------------------------------------------------------------------------
library(IMIFA)

## ---- eval=FALSE---------------------------------------------------------
#  # Simulate 100 observations from 3 balanced groups with group-specific numbers of latent factors
#  sim.data <- sim_IMIFA_data(N=100, G=3, P=20, Q=c(2, 2, 5))

## ------------------------------------------------------------------------
data(olive)
area <- olive$area

## ---- eval=FALSE---------------------------------------------------------
#  ?olive

## ---- eval=FALSE---------------------------------------------------------
#  ?mcmc_IMIFA

## ---- eval=FALSE---------------------------------------------------------
#  simMFA   <- mcmc_IMIFA(olive, method="MFA", n.iters=10000, range.G=3:6, range.Q=0:3,
#                         centering=FALSE, scaling="unit", uni.type="isotropic")

## ---- eval=FALSE---------------------------------------------------------
#  simMIFA  <- mcmc_IMIFA(olive, method="MIFA", n.iters=10000, centering=TRUE,
#                         range.G=1:3, z.init="kmeans")

## ---- eval=FALSE---------------------------------------------------------
#  simOMIFA <- mcmc_IMIFA(olive, method="OMIFA", n.iters=10000, range.G=10, nu=3, alpha=0.8,
#                         alpha.d1=3.5, alpha.d2=7, prop=0.6, epsilon=0.12)

## ---- eval=FALSE---------------------------------------------------------
#  simIMIFA <- mcmc_IMIFA(olive, method="IMIFA", n.iters=50000, s.sw=FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  resMFA  <- get_IMIFA_results(simMFA)

## ---- eval=FALSE---------------------------------------------------------
#  resMFA2 <- get_IMIFA_results(simMFA, G=3, criterion="aic.mcmc")

## ---- eval=FALSE---------------------------------------------------------
#  resIMIFA <- get_IMIFA_results(simIMIFA)

## ---- include=FALSE------------------------------------------------------
load(file="resIMIFA.rda")

## ------------------------------------------------------------------------
summary(resIMIFA)

## ---- results='hide'-----------------------------------------------------
plot(resIMIFA, plot.meth="GQ")

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="zlabels", zlabels=area, g=1)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="means", param="means", mat=TRUE, g=1)

## ---- eval=FALSE---------------------------------------------------------
#  plot(resIMIFA, plot.meth="trace", param="scores", mat=TRUE, by.fac=FALSE, ind=1)

## ---- eval=FALSE---------------------------------------------------------
#  plot(resIMIFA, plot.meth="trace", param="scores", mat=TRUE, fac=2)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="means", param="loadings", load.meth="heatmap", g=1)

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="parallel.coords", param="uniquenesses")

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="errors")

## ------------------------------------------------------------------------
plot(resIMIFA, plot.meth="all", param="alpha")

