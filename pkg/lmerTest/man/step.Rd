\name{step}
\alias{step}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Performs backward elimination of non-significant effects of linear mixed effects model:
}
\description{
performs automatic backward elimination of all effects of linear mixed effect model. First backward elimination of the random part is performed following by backward elimination of the fixed part. Finally LSMEANS(population means) and differences of LSMEANS for the fixed part of the model are calculated and the final model is provided. The p-values for the fixed effects are calculated from F test based on Sattethwaite's or Kenward-Roger approximation), p-values for the random effects are based on log-likelihood ratio test.  All analysis may be performed on lmer object of lme4 package. 
}
\usage{
step(model, ddf="Satterthwaite", type=3, alpha.random = 0.1, alpha.fixed = 0.05, 
reduce.fixed = TRUE, reduce.random = TRUE, lsmeans.calc=TRUE,
difflsmeans.calc=TRUE, test.effs=NULL, method.grad="simple", ...)

}
%- maybe also 'usage' for other objects documented here.

\arguments{
  \item{model}{
    
     linear mixed effects model (lmer object).
}

\item{ddf}{
    
     approximation for denominator degrees of freedom. By default Satterthwaite's approximation. ddf="Kenward-Roger"" calculates Kenward-Roger approximation
}

\item{type}{
   type of hypothesis to be tested (SAS notation). Either type=1 or type=3. 
}

\item{alpha.random}{
    
     significance level for elimination of the random part (for LRT test)
}

\item{alpha.fixed}{
    
     significance level for elimination of the fixed part (for F test and t-test for least squares means)
}

\item{reduce.fixed}{
    
    logical for whether the reduction of the fixed part is required
}

\item{reduce.random}{
    
    logical for whether the reduction of the random part is required
}

\item{lsmeans.calc}{    
    logical for whether the calculation of LSMEANS(population means) is required
}

\item{difflsmeans.calc}{    
    logical for whether the calculation of differences of LSMEANS is required
}

\item{test.effs}{
    
    charachter vector specifying the names of terms to be tested in LSMEANS. If NULL all the terms are tested. If lsmeans.calc==FALSE then LSMEANS are not calculated.
}

\item{method.grad}{
   approximation method for the grad function, which is used in calculation of denominator degrees of freedom. Could be "simple" or "Richardson". "simple" is the default one.
}

  \item{\dots}{
     other potential arguments.
}
}
\details{
Elimination of all effects is done one at a time.
Elimination of the fixed part is done by the principle of marginality that is: the highest order interactions are tested first: if they are significant, the lower order effects are not tested for significance. If the elimination of the random part is required, the model with REML=FALSE is updated automatically to REML=TRUE before the elimination process starts.
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
 \item{rand.table}{data frame with value of Chi square statistics, p-values  for the random effects}
  \item{anova.table }{data frame with tests for whether the model fixed terms are significant (Analysis of Variance)}
  \item{lsmeans.table}{Least Squares Means data frame with p-values and Confidence intervals}
  \item{diffs.lsmeans.table}{Differences of Least Squares Means data frame with p-values and Confidence intervals}
  \item{model}{Final model - object of merLmerTest(contains mer class) or gls (after all the required reduction has been performed)}
  }
%% ...


\author{
Alexandra Kuznetsova, Per Bruun Brockhoff, Rune Haubo Bojesen Christensen
}

\note{
 For the plots barplot2 function from gplots package was used
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{rand}}, \code{\link{lsmeans}}, \code{\link{difflsmeans}}
}
\examples{
#import lme4 package and lmerTest package
library(lmerTest)

\dontrun{
m <- lmer(Informed.liking ~ Product*Information*Gender+ 
(1|Consumer) + (1|Product:Consumer), data=ham)


#elimination of non-significant effects
s <- step(m)

#plot of post-hoc analysis of the final model
plot(s)
}



% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{ ~kwd1 }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
}