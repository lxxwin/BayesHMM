TransitionSoftmax <- function(uBeta = NULL, P = NULL, bounds = list(NULL, NULL),
                           trunc = list(NULL, NULL), k = NULL, r = NULL, param = NULL) {
  LinkDensity(
    "TransitionSoftmax",
    mget(names(formals()), sys.frame(sys.nframe()))
  )
}

freeParameters.TransitionSoftmax <- function(x) {
  uBetaStr <-
    if (is.Density(x$uBeta)) {
      uBetaBoundsStr <- make_bounds(x, "uBeta")
      sprintf(
        "
        matrix%s[K, P] uBeta[K];        // transition model regressors
                                        // uBeta[to, from, p regressors]
        ",
        uBetaBoundsStr
      )
    } else {
      ""
    }

  uBetaStr
}

fixedParameters.TransitionSoftmax <- function(x) {
  warning("fixedParameters.Softmax: TO BE IMPLEMENTED.")
  return("")
}

generated.TransitionSoftmax <- function(x) {
  ""
}

getParameterNames.TransitionSoftmax <- function(x) {
  return("uBeta")
}

logLike.TransitionSoftmax <- function(x) {
  "
  "
}

link.TransitionSoftmax <- function(x) {
  sprintf(
    "A[t, i] = softmax((u[t] * uBeta%s[i]')');",
    x$k
  )
}

prior.TransitionSoftmax <- function(x) {
  warning("prior.Softmax: TO BE IMPLEMENTED.")
  return("")
}
