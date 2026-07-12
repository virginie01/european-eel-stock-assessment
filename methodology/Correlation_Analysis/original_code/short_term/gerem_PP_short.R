PP<-read.table(file="PP.csv",header=T,sep=";",dec=".",row.names=1)
gerem<-read.table(file="fit7gerem.csv",header=T,sep=";",dec=".",row.names=1)


gerem<-log(gerem[,])#log transformation, stabilisation variance
gerem<-gerem[30:53,]
##z.score ts
moy_gerem<-matrix(nrow=7,ncol=1)
sigma_gerem<-matrix(nrow=7,ncol=1)
for(i in 1:ncol(gerem)){
  moy_gerem[i]<-mean(gerem[,i],na.rm=T)
  sigma_gerem[i]<-var(gerem[,i],na.rm=T)
}

z.gerem=matrix(nrow=24,ncol=7)
for(i in 1:ncol(gerem)){
  z.gerem[,i]<-(gerem[,i]-moy_gerem[i])*(1/sigma_gerem[i])
}
colnames(z.gerem)<-colnames(gerem)
rownames(z.gerem)<-rownames(gerem)
#transform into ts class object
#z.gerem<-as.ts(z.gerem)

##z.score PP
moy_PP<-mean(PP[,1],na.rm=T)
sigma_PP<-var(PP[,1],na.rm=T)


z.PP=matrix(nrow=24,ncol=1)

z.PP[,1]<-(PP[,1]-moy_PP)*(1/sigma_PP)

colnames(z.PP)<-colnames(PP)
rownames(z.PP)<-rownames(PP)
#transform into ts class object
#z.PP<-as.ts(z.PP)

#################extract white noise from ind_PP
library(Kendall)
library(stats)
library(caschrono)
library(tseries)

x<-c(1989:2012)
model<-lm(z.PP~x)
summary(model)# tendances
MannKendall(z.PP)#tendances
PP.test(z.PP)#pas de stationarité stochastique
plot(x,z.PP,type="l",col="black",xlab="year",ylab="z.pp")
abline(model,col="red")
diff.z.PP<-diff(z.PP,lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.PP~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.PP)#stationarité deterministe
PP.test(diff.z.PP)#stationarité stochastique
plot(xdiff,diff.z.PP,type="l",col="black",xlab="year",ylab="diff.z.PP")
abline(model,col="red")

acf(diff.z.PP)#pas d'autocorrelations
pacf(diff.z.PP)#pas d'autocorelations

Box.test.2(diff.z.PP,type="Ljung-Box",nlag=c(1:length(diff.z.PP/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.PP)
plot(diff.z.PP)
abline(h=0,col="red")

jarque.bera.test(diff.z.PP)#suit une loi normale
shapiro.test(diff.z.PP)#suit une loi normale

t.test(diff.z.PP,mu=0)#moyenne=0

#################extract white noise from R_BI
x<-c(1989:2012)
model<-lm(z.gerem[,1]~x)
summary(model)# tendance
MannKendall(z.gerem[,1])#tendance
PP.test(z.gerem[,1])#pas de stationarité stochastique
plot(x,z.gerem[,1],type="l",col="black",xlab="year",ylab="R_BI")
abline(model,col="red")
diff.z.BI<-diff(z.gerem[,1],lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.BI~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.BI)#stationarité deterministe
PP.test(diff.z.BI)#stationarité stochastique
plot(xdiff,diff.z.BI,type="l",col="black",xlab="year",ylab="diff.z.BI")
abline(model,col="red")

acf(diff.z.BI)# pas d'autocorrelations
pacf(diff.z.BI)# pas d'autocorrelations

Box.test.2(diff.z.BI,type="Ljung-Box",nlag=c(1:(length(diff.z.BI)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.BI)
plot(diff.z.BI)
abline(h=0,col="red")

jarque.bera.test(diff.z.BI)#suit une loi normale
shapiro.test(diff.z.BI)#ne suit pas une loi normale

t.test(diff.z.BI,mu=0)#moyenne=0

#################extract white noise from ATL_F
x<-c(1989:2012)
model<-lm(z.gerem[,2]~x)
summary(model)# tendance
MannKendall(z.gerem[,2])#tendance
PP.test(z.gerem[,2])#pas de stationarité stochastique
plot(x,z.gerem[,2],type="l",col="black",xlab="year",ylab="R_ATL_F")
abline(model,col="red")
diff.z.atlf<-diff(z.gerem[,2],lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.atlf~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.atlf)#stationarité deterministe
PP.test(diff.z.atlf)#stationarité stochastique
plot(xdiff,diff.z.atlf,type="l",col="black",xlab="year",ylab="diff.z.R_ATL_F")
abline(model,col="red")

acf(diff.z.atlf)# pas d'autocorrelations
pacf(diff.z.atlf)#pas d'autocorrelations

Box.test.2(diff.z.atlf,type="Ljung-Box",nlag=c(1:(length(diff.z.atlf)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.atlf)
plot(diff.z.atlf)
abline(h=0,col="red")

jarque.bera.test(diff.z.atlf)#suit une loi normale
shapiro.test(diff.z.atlf)#suit une loi normale

t.test(diff.z.atlf,mu=0)#moyenne=0


##################extract white noise from NS
x<-c(1989:2012)
model<-lm(z.gerem[,3]~x)
summary(model)# tendance
MannKendall(z.gerem[,3])#tendance
PP.test(z.gerem[,3])#pas de stationarité stochastique
plot(x,z.gerem[,3],type="l",col="black",xlab="year",ylab="R_NS")
abline(model,col="red")
diff.z.ns<-diff(z.gerem[,3],lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.ns~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.ns)#stationarité deterministe
PP.test(diff.z.ns)#stationarité stochastique
plot(xdiff,diff.z.ns,type="l",col="black",xlab="year",ylab="diff.z.ns")
abline(model,col="red")

acf(diff.z.ns)# MA=1 
pacf(diff.z.ns)#AR=1 

auto.arima(z.gerem[,3],test="pp",ic="aic")# order=(2,0,0)
auto.arima(z.gerem[,3],test="pp",ic="bic")#order=(2,0,0)

model<-arima(z.gerem[,3],order=c(1,1,0))
AIC(model)
t_stat(model)

residus_ns<-model$residuals
acf(residus_ns)#plus d'autocorrelation
pacf(residus_ns)#idem

Box.test.2(residus_ns,type="Ljung-Box",nlag=c(1:(length(residus_ns)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_ns)
plot(residus_ns)
abline(h=0,col="red")

jarque.bera.test(residus_ns)#suit une loi normale
shapiro.test(residus_ns)#suit une loi normale

t.test(residus_ns,mu=0)#moyenne diff?rente de 0 !!


##################extract white noise from Manche
x<-c(1989:2012)
model<-lm(z.gerem[,4]~x)
summary(model)# tendance
MannKendall(z.gerem[,4])#tendance
PP.test(z.gerem[,4])#pas de stationarité stochastique
plot(x,z.gerem[,4],type="l",col="black",xlab="year",ylab="R_NS")
abline(model,col="red")
diff.z.manche<-diff(z.gerem[,4],lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.manche~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.manche)#stationarité deterministe
PP.test(diff.z.manche)#stationarité stochastique
plot(xdiff,diff.z.manche,type="l",col="black",xlab="year",ylab="diff.z.ns")
abline(model,col="red")

acf(diff.z.manche)# pas d'autocorr?lations
pacf(diff.z.manche)#pas d'autocorr?lations

Box.test.2(diff.z.manche,type="Ljung-Box",nlag=c(1:(length(diff.z.manche)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.manche)
plot(diff.z.manche)
abline(h=0,col="red")

jarque.bera.test(diff.z.manche)#suit une loi normale
shapiro.test(diff.z.manche)#suit une loi normale

t.test(diff.z.manche,mu=0)#moyenne=0


##################extract white noise from ATL_IB
x<-c(1989:2012)
model<-lm(z.gerem[,5]~x)
summary(model)# tendance
MannKendall(z.gerem[,5])#tendance
PP.test(z.gerem[,5])#pas de stationarité stochastique
plot(x,z.gerem[,5],type="l",col="black",xlab="year",ylab="atl_ib")
abline(model,col="red")
diff.z.ib<-diff(z.gerem[,5],lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.ib~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.ib)#stationarité deterministe
PP.test(diff.z.ib)#stationarité stochastique
plot(xdiff,diff.z.ib,type="l",col="black",xlab="year",ylab="diff.z.ib")
abline(model,col="red")

acf(diff.z.ib)# pas d'autocorr?lations
pacf(diff.z.ib)#pas d'autocorrelations

Box.test.2(diff.z.ib,type="Ljung-Box",nlag=c(1:(length(diff.z.ib)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.ib)
plot(diff.z.ib)
abline(h=0,col="red")

jarque.bera.test(diff.z.ib)#suit une loi normale
shapiro.test(diff.z.ib)#suit une loi normale

t.test(diff.z.ib,mu=0)#moyenne=0


##################extract white noise from Med
x<-c(1989:2012)
model<-lm(z.gerem[,6]~x)
summary(model)# tendance
MannKendall(z.gerem[,6])#tendance
PP.test(z.gerem[,6])#pas de stationarité stochastique
plot(x,z.gerem[,6],type="l",col="black",xlab="year",ylab="med")
abline(model,col="red")
diff.z.med<-diff(z.gerem[,6],lag=1,differences = 2)
xdiff<-c(1991:2012)
model<-lm(diff.z.med~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.med)#stationarité deterministe
PP.test(diff.z.med)#stationarité stochastique
plot(xdiff,diff.z.med,type="l",col="black",xlab="year",ylab="diff.z.med")
abline(model,col="red")

acf(diff.z.med)# rien
pacf(diff.z.med)#idem

Box.test.2(diff.z.med,type="Ljung-Box",nlag=c(1:(length(diff.z.med)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.med)
plot(diff.z.med)
abline(h=0,col="red")

jarque.bera.test(diff.z.med)#suit une loi normale
shapiro.test(diff.z.med)#suit une loi normale

t.test(diff.z.med,mu=0)#moyenne=0

##################extract white noise from Rglobal
x<-c(1989:2012)
model<-lm(z.gerem[,7]~x)
summary(model)# tendance
MannKendall(z.gerem[,7])#tendance
PP.test(z.gerem[,7])#pas de stationarité stochastique
plot(x,z.gerem[,7],type="l",col="black",xlab="year",ylab="rglob")
abline(model,col="red")
diff.z.rglob<-diff(z.gerem[,7],lag=1,differences = 1)
xdiff<-c(1990:2012)
model<-lm(diff.z.rglob~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.rglob)#stationarité deterministe
PP.test(diff.z.rglob)#stationarité stochastique
plot(xdiff,diff.z.rglob,type="l",col="black",xlab="year",ylab="diff.z.rglob")
abline(model,col="red")

acf(diff.z.rglob)#rien
pacf(diff.z.rglob)#idem

Box.test.2(diff.z.rglob,type="Ljung-Box",nlag=c(1:(length(diff.z.rglob)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.rglob)
plot(diff.z.rglob)
abline(h=0,col="red")

jarque.bera.test(diff.z.rglob)#suit une loi normale
shapiro.test(diff.z.rglob)#suit une loi normale

t.test(diff.z.rglob,mu=0)#moyenne=0


########## correlations CCF
diff.z.PP=as.vector(diff.z.PP)
diff.z.BI=as.vector(diff.z.BI)
diff.z.atlf=as.vector(diff.z.atlf)
residus_ns=as.vector(residus_ns)
diff.z.manche=as.vector(diff.z.manche)
diff.z.ib=as.vector(diff.z.ib)
diff.z.med=as.vector(diff.z.med)
diff.z.rglob=as.vector(diff.z.rglob)
ccf(x=diff.z.PP,y=diff.z.BI,type="correlation",plot=T)#
ccf(x=diff.z.PP,y=diff.z.atlf,type="correlation",plot=T)#
ccf(x=diff.z.PP,y=residus_ns,type="correlation",plot=T)# autocorrelation ? +2
ccf(x=diff.z.PP,y=diff.z.manche,type="correlation",plot=T)# 
ccf(x=diff.z.PP,y=diff.z.ib,type="correlation",plot=T)#autocorrelation ? 0
ccf(x=diff.z.PP,y=diff.z.med,type="correlation",plot=T)#autocorrelation ? +1
ccf(x=diff.z.PP,y=diff.z.rglob,type="correlation",plot=T)# 

par(mfrow=c(2,2),oma=c(2,2,2,2)+0.1,mar=c(4,3,1,1)+0.1)
xv1=1992:2012
plot(xv1,residus_ns[4:24],type="b",pch=17,lty=1,xlab="",ylab="",main="North Sea",cex.main=0.90)
par(new=T)
plot(xv1,diff.z.PP[1:21],col="red",type="b",pch=20,lty=2,xlab="",ylab="",yaxt="n",xaxt="n")
axis(4)
ccf(x=diff.z.PP,y=residus_ns,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="")# autocorrelation ? +2

#xv2=1990:2012
#plot(xv2,diff.z.ib[1:23],type="b",pch=17,lty=1,xlab="",ylab="",main="Iberian Coast")
#par(new=T)
#plot(xv2,diff.z.PP[1:23],col="red",type="b",pch=20,lty=2,xlab="",ylab="",yaxt="n",xaxt="n")
#axis(4)
#ccf(x=diff.z.PP,y=diff.z.ib,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="")

xv3=1991:2012
plot(xv3,diff.z.med[1:22],type="b",pch=17,lty=1,xlab="Year",ylab="",main="Mediterranean Sea",cex.main=0.90,cex.lab=1.25)
par(new=T)
plot(xv3,diff.z.PP[1:22],col="red",type="b",pch=20,lty=2,xlab="",ylab="",yaxt="n",xaxt="n")
axis(4)
ccf(x=diff.z.PP,y=diff.z.med,type="correlation",plot=T,lag.max=5,xlab="Lag",ylab="",main="",cex.lab=1.25)

mtext("Recruitment index/PP",side=2,line=1,outer=TRUE)
mtext("CCF",side=4,line=1,outer=TRUE)