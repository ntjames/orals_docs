# load packages
libs<-c("copula","scatterplot3d")
invisible(lapply(libs, library, character.only = TRUE))

figpath <- "/home/nathan/Dropbox/njames/school/PhD/misc/creating effective talks/practice_pres/fig"

op<-par(mar=c(0,0,0,0),oma=c(0,0,0,0))

w=400
h=300

png(file.path(figpath,"normal.png"), width=w, height=h)
curve(dnorm,-5,5,xaxt="n",yaxt="n",xlab="",ylab="")
dev.off()

png(file.path(figpath,"gamma.png"), width=w, height=h)
curve(dgamma(x,2),0,6,xaxt="n",yaxt="n",xlab="",ylab="")
dev.off()

exMvd <- mvdc(copula = archmCopula(family = "gumbel", param = 1.2),
              margins = c("norm", "gamma"),
              paramMargins = list(list(mean=0, sd = 1),
                                  list(shape=2, rate = 1)))

png(file.path(figpath,"gumbel_cop.png"),height=700,width=700)
persp(exMvd, dMvdc, xlim=c(-4,4), ylim=c(-1,8), shade=0.3,
      theta=50, phi=20, box=FALSE, r=1, xaxs = "i")
dev.off()

exMvd2 <- mvdc(copula = ellipCopula(family="normal",param=-0.3),
              margins = c("norm", "gamma"),
              paramMargins = list(list(mean=0, sd = 1),
                                  list(shape=2, rate = 1)))

persp(exMvd2, dMvdc, xlim=c(-4,4), ylim=c(-1,8), shade=0.3,
      theta=50, phi=20, box=FALSE)
