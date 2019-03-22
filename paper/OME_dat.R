uni_dat0<-data.frame(
  entry=rep("unilateral",12),
  trt=c(rep("cefaclor",6),rep("amox",6)),
  age=rep(c("<2","2-5",">=6"),2),
  status=sort(rep(c("N","U"),3)),
  count=c(3,24,11,9,7,8,
          2,14,11,10,22,7) )

uni_dat <- uni_dat0[rep(row.names(uni_dat0), uni_dat0$count),1:4]
uni_dat$id <- 1:nrow(uni_dat)

uni_dat$cured <- 0
uni_dat[uni_dat$status=="N",'cured']<-1

uni_dat$ear<-1

uni_dat$trt <- factor(uni_dat$trt,levels= rev(levels(uni_dat$trt)))

bi_dat0<-data.frame(
  entry=rep("bilateral",18),
  trt=c(rep("cefaclor",9),rep("amox",9)),
  age=rep(c("<2","2-5",">=6"),3),
  status=sort(rep(c("N","U","B"),3)),
  count = c(8,6,0,8,10,3,2,6,1,
            11,3,1,2,5,6,2,1,0) )

bi_dat1 <- bi_dat0[rep(row.names(bi_dat0), bi_dat0$count),1:4]
bi_dat1$id <- (nrow(uni_dat)+1):(nrow(uni_dat) + nrow(bi_dat1))

bi_dat<-rbind(bi_dat1,bi_dat1)
bi_dat<-bi_dat[order(bi_dat$id),]

bi_dat$cured <- 0
bi_dat[bi_dat$status=="U",'cured']<-c(0,1)
bi_dat[bi_dat$status=="N",'cured']<-1

bi_dat$ear<-c(1,2)

bi_dat$trt <- factor(bi_dat$trt,levels= rev(levels(bi_dat$trt)))

rm(bi_dat0,bi_dat1,uni_dat0)

save(bi_dat, uni_dat, file = "OME_dat.RData")
