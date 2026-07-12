NAO<-read.table(file="NAO.csv",header=T,sep=";",dec=".",row.names=1)
gerem<-read.table(file="fit7gerem.csv",header=T,sep=";",dec=".",row.names=1)

#données de 1960 à 2015
NAO<-NAO[11:66,]

gerem<-log(gerem[,])#log transformation, stabilisation variance

##z.score ts
moy_gerem<-matrix(nrow=7,ncol=1)
sigma_gerem<-matrix(nrow=7,ncol=1)
for(i in 1:ncol(gerem)){
  moy_gerem[i]<-mean(gerem[,i],na.rm=T)
  sigma_gerem[i]<-var(gerem[,i],na.rm=T)
}

z.gerem=matrix(nrow=56,ncol=7)
for(i in 1:ncol(gerem)){
  z.gerem[,i]<-(gerem[,i]-moy_gerem[i])*(1/sigma_gerem[i])
}
colnames(z.gerem)<-colnames(gerem)
rownames(z.gerem)<-rownames(gerem)
#transform into ts class object
z.gerem<-as.ts(z.gerem)

##z.score NAO
moy_NAO<-matrix(nrow=6,ncol=1)
sigma_NAO<-matrix(nrow=6,ncol=1)
for(i in 1:ncol(NAO)){
  moy_NAO[i]<-mean(NAO[,i],na.rm=T)
  sigma_NAO[i]<-var(NAO[,i],na.rm=T)
}

z.NAO=matrix(nrow=56,ncol=6)
for(i in 1:ncol(NAO)){
  z.NAO[,i]<-(NAO[,i]-moy_NAO[i])*(1/sigma_NAO[i])
}
colnames(z.NAO)<-colnames(NAO)
rownames(z.NAO)<-rownames(NAO)
#transform into ts class object
z.NAO<-as.ts(z.NAO)

#################extract white noise from ind_NAO
library(Kendall)
library(stats)
library(caschrono)
library(tseries)

x<-c(1960:2015)
model<-lm(z.NAO[,1]~x)
summary(model)# pas de tendances
MannKendall(z.NAO[,1])#pas de tendances, stationarité déterministe
PP.test(z.NAO[,1])#stationarité stochastique
plot(x,z.NAO[,1],type="l",col="black",xlab="year",ylab="z.nao")
abline(model,col="red")


acf(z.NAO[,1])# pas d'autocorrelations
pacf(z.NAO[,1])#pas d'autocorrelations partielles

Box.test.2(z.NAO[,1],type="Ljung-Box",nlag=c(1:(length(z.NAO[,1])/4)),decim=3)#residus non autocorrélés+variance constante

hist(z.NAO[,1])
plot(z.NAO[,1])
abline(h=0,col="red")

jarque.bera.test(z.NAO[,1])#suit une loi normale
shapiro.test(z.NAO[,1])#suit une loi normale

t.test(z.NAO[,1],mu=0)#moyenne=0

#################extract white noise from MOY_NAO_2

x<-c(1960:2015)
model<-lm(z.NAO[,5]~x)
summary(model)# pas de tendances
MannKendall(z.NAO[,5])#pas de tendances, stationarité déterministe
PP.test(z.NAO[,5])#pas de stationarit? stochastique
plot(x,z.NAO[,5],type="l",col="black",xlab="year",ylab="z.nao")
abline(model,col="red")


acf(z.NAO[,5])# MA 1 et 2
pacf(z.NAO[,5])#pas d'autocorrelations partielles

auto.arima(z.NAO[,5],test="pp",ic="aic")# order (0,1,0)
auto.arima(z.NAO[,5],test="pp",ic="bic")#order(0,1,0)

model<-arima(z.NAO[,5],order=c(0,1,2))
AIC(model)
t_stat(model)

residus_moy_nao_2<-model$residuals
acf(residus_moy_nao_2)#pas d'autocorr?lations
pacf(residus_moy_nao_2)#pas d'autocorr?lations

Box.test.2(residus_moy_nao_2,type="Ljung-Box",nlag=c(1:(length(residus_moy_nao_2)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_moy_nao_2)
plot(residus_moy_nao_2)
abline(h=0,col="red")

jarque.bera.test(residus_moy_nao_2)# suit une loi normale
shapiro.test(residus_moy_nao_2)#suit une loi normale

t.test(residus_moy_nao_2,mu=0)#moyenne=0

#################extract white noise from MOY_NAO_3

x<-c(1960:2015)
model<-lm(z.NAO[,6]~x)
summary(model)# pas de tendances
MannKendall(z.NAO[,6])#pas de tendances, stationarité déterministe
PP.test(z.NAO[,6])#pas de stationarit? stochastique
plot(x,z.NAO[,6],type="l",col="black",xlab="year",ylab="z.nao")
abline(model,col="red")


acf(z.NAO[,6])# MA 1 ? 3
pacf(z.NAO[,6])#pas d'autocorrelations partielles

auto.arima(z.NAO[,6],test="pp",ic="aic")# order (1,1,1)
auto.arima(z.NAO[,6],test="pp",ic="bic")#order(0,1,0)

model<-arima(z.NAO[,6],order=c(0,1,3))
AIC(model)
t_stat(model)

residus_moy_nao_3<-model$residuals
acf(residus_moy_nao_3)#pas d'autocorr?lations
pacf(residus_moy_nao_3)#pas d'autocorr?lations

Box.test.2(residus_moy_nao_3,type="Ljung-Box",nlag=c(1:(length(residus_moy_nao_3)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_moy_nao_3)
plot(residus_moy_nao_3)
abline(h=0,col="red")

jarque.bera.test(residus_moy_nao_3)# suit une loi normale
shapiro.test(residus_moy_nao_3)#suit une loi normale

t.test(residus_moy_nao_3,mu=0)#moyenne=0

#################extract white noise from R_BI
x<-c(1960:2015)
model<-lm(z.gerem[,1]~x)
summary(model)# tendance
MannKendall(z.gerem[,1])#tendance
PP.test(z.gerem[,1])#pas de stationarité stochastique
plot(x,z.gerem[,1],type="l",col="black",xlab="year",ylab="R_BI")
abline(model,col="red")
diff.z.BI<-diff(z.gerem[,1],lag=1,differences = 1)
xdiff<-c(1961:2015)
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
wilcox.test(diff.z.BI,mu=0)#moyenne=0

#################extract white noise from ATL_F
x<-c(1960:2015)
model<-lm(z.gerem[,2]~x)
summary(model)# tendance
MannKendall(z.gerem[,2])#tendance
PP.test(z.gerem[,2])#pas de stationarité stochastique
plot(x,z.gerem[,2],type="l",col="black",xlab="year",ylab="R_ATL_F")
abline(model,col="red")
diff.z.atlf<-diff(z.gerem[,2],lag=1,differences = 1)
xdiff<-c(1961:2015)
model<-lm(diff.z.atlf~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.atlf)#stationarité deterministe
PP.test(diff.z.atlf)#stationarité stochastique
plot(xdiff,diff.z.atlf,type="l",col="black",xlab="year",ylab="diff.z.R_ATL_F")
abline(model,col="red")

acf(diff.z.atlf)# MA=1 et M=4
pacf(diff.z.atlf)#AR=1 et 4

auto.arima(z.gerem[,2],test="pp",ic="aic")# order=(0,1,1)
auto.arima(z.gerem[,2],test="pp",ic="bic")#order=(0,1,0)

model<-arima(z.gerem[,2],order=c(2,1,2))
AIC(model)
t_stat(model)

residus_atlf<-model$residuals
acf(residus_atlf)#plus d'autocorrelation
pacf(residus_atlf)#idem

Box.test.2(residus_atlf,type="Ljung-Box",nlag=c(1:(length(residus_atlf)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_atlf)
plot(residus_atlf)
abline(h=0,col="red")

jarque.bera.test(residus_atlf)#suit une loi normale
shapiro.test(residus_atlf)#suit une loi normale

t.test(residus_atlf,mu=0)#moyenne=0


##################extract white noise from NS
x<-c(1960:2015)
model<-lm(z.gerem[,3]~x)
summary(model)# tendance
MannKendall(z.gerem[,3])#tendance
PP.test(z.gerem[,3])#pas de stationarité stochastique
plot(x,z.gerem[,3],type="l",col="black",xlab="year",ylab="R_NS")
abline(model,col="red")
diff.z.ns<-diff(z.gerem[,3],lag=1,differences = 1)
xdiff<-c(1961:2015)
model<-lm(diff.z.ns~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.ns)#stationarité deterministe
PP.test(diff.z.ns)#stationarité stochastique
plot(xdiff,diff.z.ns,type="l",col="black",xlab="year",ylab="diff.z.ns")
abline(model,col="red")

acf(diff.z.ns)# MA=1 et M=4 et m=5
pacf(diff.z.ns)#AR=1 et 4

auto.arima(z.gerem[,3],test="pp",ic="aic")# order=(1,0,2)
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
x<-c(1960:2015)
model<-lm(z.gerem[,4]~x)
summary(model)# tendance
MannKendall(z.gerem[,4])#tendance
PP.test(z.gerem[,4])#pas de stationarité stochastique
plot(x,z.gerem[,4],type="l",col="black",xlab="year",ylab="R_NS")
abline(model,col="red")
diff.z.manche<-diff(z.gerem[,4],lag=1,differences = 1)
xdiff<-c(1961:2015)
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

jarque.bera.test(diff.z.manche)#ne suit pas une loi normale
shapiro.test(diff.z.manche)#suit une loi normale

t.test(diff.z.manche,mu=0)#moyenne=0
wilcox.test(diff.z.manche,mu=0)#moyenne=0


##################extract white noise from ATL_IB
x<-c(1960:2015)
model<-lm(z.gerem[,5]~x)
summary(model)# tendance
MannKendall(z.gerem[,5])#tendance
PP.test(z.gerem[,5])#pas de stationarité stochastique
plot(x,z.gerem[,5],type="l",col="black",xlab="year",ylab="atl_ib")
abline(model,col="red")
diff.z.ib<-diff(z.gerem[,5],lag=1,differences = 1)
xdiff<-c(1961:2015)
model<-lm(diff.z.ib~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.ib)#stationarité deterministe
PP.test(diff.z.ib)#stationarité stochastique
plot(xdiff,diff.z.ib,type="l",col="black",xlab="year",ylab="diff.z.ib")
abline(model,col="red")

acf(diff.z.ib)# pas d'autocorr?lations
pacf(diff.z.ib)#AR=3

auto.arima(z.gerem[,5],test="pp",ic="aic")# order=(0,1,0)
auto.arima(z.gerem[,5],test="pp",ic="bic")#order=(0,1,0)

model<-arima(z.gerem[,5],order=c(1,1,0))
AIC(model)
t_stat(model)

residus_ib<-model$residuals
acf(residus_ib)#plus d'autocorrelation
pacf(residus_ib)#idem


Box.test.2(residus_ib,type="Ljung-Box",nlag=c(1:(length(residus_ib)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_ib)
plot(residus_ib)
abline(h=0,col="red")

jarque.bera.test(residus_ib)#suit une loi normale
shapiro.test(residus_ib)#suit une loi normale

t.test(residus_ib,mu=0)#moyenne=0


##################extract white noise from Med
x<-c(1960:2015)
model<-lm(z.gerem[,6]~x)
summary(model)# tendance
MannKendall(z.gerem[,6])#tendance
PP.test(z.gerem[,6])#pas de stationarité stochastique
plot(x,z.gerem[,6],type="l",col="black",xlab="year",ylab="med")
abline(model,col="red")
diff.z.med<-diff(z.gerem[,6],lag=1,differences = 1)
xdiff<-c(1961:2015)
model<-lm(diff.z.med~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.med)#stationarité deterministe
PP.test(diff.z.med)#stationarité stochastique
plot(xdiff,diff.z.med,type="l",col="black",xlab="year",ylab="diff.z.med")
abline(model,col="red")

acf(diff.z.med)# reste qqchose ? +16
pacf(diff.z.med)#idem

Box.test.2(diff.z.med,type="Ljung-Box",nlag=c(1:(length(diff.z.med)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.med)
plot(diff.z.med)
abline(h=0,col="red")

jarque.bera.test(diff.z.med)#ne suit pas une loi normale
shapiro.test(diff.z.med)#suit une loi normale

t.test(diff.z.med,mu=0)#moyenne=0
wilcox.test(diff.z.med,mu=0)#moyenne=0

##################extract white noise from Rglobal
x<-c(1960:2015)
model<-lm(z.gerem[,7]~x)
summary(model)# tendance
MannKendall(z.gerem[,7])#tendance
PP.test(z.gerem[,7])#pas de stationarité stochastique
plot(x,z.gerem[,7],type="l",col="black",xlab="year",ylab="rglob")
abline(model,col="red")
diff.z.rglob<-diff(z.gerem[,7],lag=1,differences = 1)
xdiff<-c(1961:2015)
model<-lm(diff.z.rglob~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.rglob)#stationarité deterministe
PP.test(diff.z.rglob)#stationarité stochastique
plot(xdiff,diff.z.rglob,type="l",col="black",xlab="year",ylab="diff.z.rglob")
abline(model,col="red")

acf(diff.z.rglob)#MA=4
pacf(diff.z.rglob)#idem

auto.arima(z.gerem[,7],test="pp",ic="aic")# order=(1,1,0)
auto.arima(z.gerem[,7],test="pp",ic="bic")#order=(0,1,0)

model<-arima(z.gerem[,7],order=c(2,1,2))
AIC(model)
t_stat(model)

residus_rglob<-model$residuals
acf(residus_rglob)#plus d'autocorrelation
pacf(residus_rglob)#idem

Box.test.2(residus_rglob,type="Ljung-Box",nlag=c(1:(length(residus_rglob)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_rglob)
plot(residus_rglob)
abline(h=0,col="red")

jarque.bera.test(residus_rglob)#suit une loi normale
shapiro.test(residus_rglob)#suit une loi normale

t.test(residus_rglob,mu=0)#moyenne=0


########## correlations CCF
par(mfrow=c(2,3),oma=c(3,4,2,2)+0.1,mar=c(3,3,3,1)+0.1)
ccf(x=z.NAO[,1],y=diff.z.BI,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="British Isles",cex.main=0.60)#correlation positive ? +2 et negative ? +3
ccf(x=z.NAO[,1],y=residus_atlf,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="Bay of Biscay",cex.main=0.60)#pas d'autocorrelation
ccf(x=z.NAO[,1],y=residus_ns,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="North Sea",cex.main=0.60)# correlation negative ? +3
ccf(x=z.NAO[,1],y=diff.z.manche,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="English Channel",cex.main=0.60)# correlation negative ? +3
ccf(x=z.NAO[,1],y=residus_ib,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="Iberian Coast",cex.main=0.60)# correlation negative ? +3
ccf(x=z.NAO[,1],y=diff.z.med,type="correlation",plot=T,lag.max=5,xlab="",ylab="",main="Mediterranean sea",cex.main=0.60)# correlation negative ? +0
#ccf(x=z.NAO[,1],y=residus_rglob,type="correlation",plot=T)# pas d'autocorrelation
title(xlab="Lag",ylab="CCF",line=1,outer=TRUE,font.lab=2,cex.lab=1.25)

#########pearson correlations coeff: pas de correlations at all !!
cor.test(x=residus_moy_nao_2[2:56], y=diff.z.BI,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3[2:56], y=diff.z.BI,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_2, y=residus_atlf,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3, y=residus_atlf,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_2, y=residus_ns,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3, y=residus_ns,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_2[2:56], y=diff.z.manche,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3[2:56], y=diff.z.manche,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_2, y=residus_ib,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3, y=residus_ib,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_2[2:56], y=diff.z.med,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3[2:56], y=diff.z.med,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_2, y=residus_rglob,alternative ="two.sided",method = "pearson")
cor.test(x=residus_moy_nao_3, y=residus_rglob,alternative ="two.sided",method = "pearson")

