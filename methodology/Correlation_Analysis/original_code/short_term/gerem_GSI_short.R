GSI<-read.table(file="GSI.csv",header=T,sep=";",dec=".",row.names=1)
gerem<-read.table(file="fit7gerem.csv",header=T,sep=";",dec=".",row.names=1)

GSI<-GSI[1:49,]# de 1966 ? 2014
gerem<-log(gerem[,])#log transformation, stabilisation variance
gerem<-gerem[7:55,]#de 1966 ? 2014
##z.score ts
moy_gerem<-matrix(nrow=7,ncol=1)
sigma_gerem<-matrix(nrow=7,ncol=1)
for(i in 1:ncol(gerem)){
  moy_gerem[i]<-mean(gerem[,i],na.rm=T)
  sigma_gerem[i]<-var(gerem[,i],na.rm=T)
}

z.gerem=matrix(nrow=49,ncol=7)
for(i in 1:ncol(gerem)){
  z.gerem[,i]<-(gerem[,i]-moy_gerem[i])*(1/sigma_gerem[i])
}
colnames(z.gerem)<-colnames(gerem)
rownames(z.gerem)<-rownames(gerem)
#transform into ts class object
z.gerem<-as.ts(z.gerem)

##z.score GSI
moy_GSI<-matrix(nrow=6,ncol=1)
sigma_GSI<-matrix(nrow=6,ncol=1)
for(i in 1:ncol(GSI)){
  moy_GSI[i]<-mean(GSI[,i],na.rm=T)
  sigma_GSI[i]<-var(GSI[,i],na.rm=T)
}

z.GSI=matrix(nrow=49,ncol=6)
for(i in 1:ncol(GSI)){
  z.GSI[,i]<-(GSI[,i]-moy_GSI[i])*(1/sigma_GSI[i])
}
colnames(z.GSI)<-colnames(GSI)
rownames(z.GSI)<-rownames(GSI)
#transform into ts class object
z.GSI<-as.ts(z.GSI)

#################extract white noise from ind_GSI
library(Kendall)
library(stats)
library(caschrono)
library(tseries)

x<-c(1966:2014)
model<-lm(z.GSI[,1]~x)
summary(model)# tendances
MannKendall(z.GSI[,1])#tendances
PP.test(z.GSI[,1])# pas de stationarité stochastique
plot(x,z.GSI[,1],type="l",col="black",xlab="year",ylab="z.gsi")
abline(model,col="red")
diff.z.gsi<-diff(z.GSI[,1],lag=1,differences = 1)
xdiff<-c(1967:2014)
model<-lm(diff.z.gsi~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.gsi)#stationarité deterministe
PP.test(diff.z.gsi)#stationarité stochastique
plot(xdiff,diff.z.gsi,type="l",col="black",xlab="year",ylab="diff.z.gsi")
abline(model,col="red")

acf(diff.z.gsi)# pas d'autocorrelations
pacf(diff.z.gsi)#pas d'autocorrelations partielles

Box.test.2(diff.z.gsi,type="Ljung-Box",nlag=c(1:(length(diff.z.gsi)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.gsi)
plot(diff.z.gsi)
abline(h=0,col="red")

jarque.bera.test(diff.z.gsi)#suit une loi normale
shapiro.test(diff.z.gsi)#suit une loi normale

t.test(diff.z.gsi,mu=0)#moyenne=0

#################extract white noise from MOY_GSI_2

gsi2<-z.GSI[2:49,5]#extraction donn?es dispo de 1967 ? 2014
x<-c(1967:2014)
model<-lm(gsi2~x)
summary(model)# tendances
MannKendall(gsi2)#tendances
PP.test(gsi2)# pas de stationarité stochastique
plot(x,gsi2,type="l",col="black",xlab="year",ylab="z.gsi")
abline(model,col="red")
diff.z.gsi2<-diff(gsi2,lag=1,differences = 1)
xdiff<-c(1968:2014)
model<-lm(diff.z.gsi2~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.gsi2)#stationarité deterministe
PP.test(diff.z.gsi2)#stationarité stochastique
plot(xdiff,diff.z.gsi2,type="l",col="black",xlab="year",ylab="diff.z.gsi")
abline(model,col="red")

acf(diff.z.gsi2)# MA=1..
pacf(diff.z.gsi2)#AR=1,2,4

auto.arima(gsi2,test="pp",ic="aic")# order=(2,1,0)
auto.arima(gsi2,test="pp",ic="bic")#order=(2,1,0)

model<-arima(gsi2,order=c(0,1,1))
AIC(model)
t_stat(model)

residus_gsi2<-model$residuals
acf(residus_gsi2)#plus d'autocorrelation
pacf(residus_gsi2)#idem

Box.test.2(residus_gsi2,type="Ljung-Box",nlag=c(1:(length(residus_gsi2)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_gsi2)
plot(residus_gsi2)
abline(h=0,col="red")

jarque.bera.test(residus_gsi2)#suit une loi normale
shapiro.test(residus_gsi2)#suit une loi normale

t.test(residus_gsi2,mu=0)#moyenne=0

#################extract white noise from MOY_GSI_3
gsi3<-z.GSI[2:49,6]#extraction donn?es dispo de 1967 ? 2014
x<-c(1967:2014)
model<-lm(gsi3~x)
summary(model)# tendances
MannKendall(gsi3)#tendances
PP.test(gsi3)# pas de stationarité stochastique
plot(x,gsi3,type="l",col="black",xlab="year",ylab="z.gsi")
abline(model,col="red")
diff.z.gsi3<-diff(gsi3,lag=1,differences = 1)
xdiff<-c(1968:2014)
model<-lm(diff.z.gsi3~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.gsi3)#stationarité deterministe
PP.test(diff.z.gsi3)#stationarité stochastique
plot(xdiff,diff.z.gsi3,type="l",col="black",xlab="year",ylab="diff.z.gsi")
abline(model,col="red")

acf(diff.z.gsi3)# MA=1..
pacf(diff.z.gsi3)#AR=1,2,3

auto.arima(gsi3,test="pp",ic="aic")# order=(2,1,2)
auto.arima(gsi3,test="pp",ic="bic")#order=(2,1,2)

model<-arima(gsi3,order=c(1,1,2))
AIC(model)
t_stat(model)

residus_gsi3<-model$residuals
acf(residus_gsi3)#plus d'autocorrelation
pacf(residus_gsi3)#idem

Box.test.2(residus_gsi3,type="Ljung-Box",nlag=c(1:(length(residus_gsi3)/4)),decim=3)#residus non autocorrélés+variance constante

hist(residus_gsi3)
plot(residus_gsi3)
abline(h=0,col="red")

jarque.bera.test(residus_gsi3)#suit une loi normale
shapiro.test(residus_gsi3)#suit une loi normale

t.test(residus_gsi3,mu=0)#moyenne=0



#################extract white noise from R_BI
x<-c(1966:2014)
model<-lm(z.gerem[,1]~x)
summary(model)# tendance
MannKendall(z.gerem[,1])#tendance
PP.test(z.gerem[,1])#pas de stationarité stochastique
plot(x,z.gerem[,1],type="l",col="black",xlab="year",ylab="R_BI")
abline(model,col="red")
diff.z.BI<-diff(z.gerem[,1],lag=1,differences = 1)
xdiff<-c(1967:2014)
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
x<-c(1966:2014)
model<-lm(z.gerem[,2]~x)
summary(model)# tendance
MannKendall(z.gerem[,2])#tendance
PP.test(z.gerem[,2])#pas de stationarité stochastique
plot(x,z.gerem[,2],type="l",col="black",xlab="year",ylab="R_ATL_F")
abline(model,col="red")
diff.z.atlf<-diff(z.gerem[,2],lag=1,differences = 1)
xdiff<-c(1967:2014)
model<-lm(diff.z.atlf~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.atlf)#stationarité deterministe
PP.test(diff.z.atlf)#stationarité stochastique
plot(xdiff,diff.z.atlf,type="l",col="black",xlab="year",ylab="diff.z.R_ATL_F")
abline(model,col="red")

acf(diff.z.atlf)#pas d'autocorrelations
pacf(diff.z.atlf)#qqchose ? AR=4

Box.test.2(diff.z.atlf,type="Ljung-Box",nlag=c(1:(length(diff.z.atlf)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.atlf)
plot(diff.z.atlf)
abline(h=0,col="red")

jarque.bera.test(diff.z.atlf)#suit une loi normale
shapiro.test(diff.z.atlf)#suit une loi normale

t.test(diff.z.atlf,mu=0)#moyenne=0


##################extract white noise from NS
x<-c(1966:2014)
model<-lm(z.gerem[,3]~x)
summary(model)# tendance
MannKendall(z.gerem[,3])#tendance
PP.test(z.gerem[,3])#pas de stationarité stochastique
plot(x,z.gerem[,3],type="l",col="black",xlab="year",ylab="R_NS")
abline(model,col="red")
diff.z.ns<-diff(z.gerem[,3],lag=1,differences = 1)
xdiff<-c(1967:2014)
model<-lm(diff.z.ns~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.ns)#stationarité deterministe
PP.test(diff.z.ns)#stationarité stochastique
plot(xdiff,diff.z.ns,type="l",col="black",xlab="year",ylab="diff.z.ns")
abline(model,col="red")

acf(diff.z.ns)# MA=1 et M=5
pacf(diff.z.ns)#AR=1 

auto.arima(z.gerem[,3],test="pp",ic="aic")# order=(2,0,0)
auto.arima(z.gerem[,3],test="pp",ic="bic")#order=(1,0,0)

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
x<-c(1966:2014)
model<-lm(z.gerem[,4]~x)
summary(model)# tendance
MannKendall(z.gerem[,4])#tendance
PP.test(z.gerem[,4])#pas de stationarité stochastique
plot(x,z.gerem[,4],type="l",col="black",xlab="year",ylab="R_NS")
abline(model,col="red")
diff.z.manche<-diff(z.gerem[,4],lag=1,differences = 1)
xdiff<-c(1967:2014)
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
x<-c(1966:2014)
model<-lm(z.gerem[,5]~x)
summary(model)# tendance
MannKendall(z.gerem[,5])#tendance
PP.test(z.gerem[,5])#pas de stationarité stochastique
plot(x,z.gerem[,5],type="l",col="black",xlab="year",ylab="atl_ib")
abline(model,col="red")
diff.z.ib<-diff(z.gerem[,5],lag=1,differences = 1)
xdiff<-c(1967:2014)
model<-lm(diff.z.ib~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.ib)#stationarité deterministe
PP.test(diff.z.ib)#stationarité stochastique
plot(xdiff,diff.z.ib,type="l",col="black",xlab="year",ylab="diff.z.ib")
abline(model,col="red")

acf(diff.z.ib)# pas d'autocorr?lations
pacf(diff.z.ib)#idem

Box.test.2(diff.z.ib,type="Ljung-Box",nlag=c(1:(length(diff.z.ib)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.ib)
plot(diff.z.ib)
abline(h=0,col="red")

jarque.bera.test(diff.z.ib)#suit une loi normale
shapiro.test(diff.z.ib)#suit une loi normale

t.test(diff.z.ib,mu=0)#moyenne=0


##################extract white noise from Med
x<-c(1966:2014)
model<-lm(z.gerem[,6]~x)
summary(model)# tendance
MannKendall(z.gerem[,6])#tendance
PP.test(z.gerem[,6])#pas de stationarité stochastique
plot(x,z.gerem[,6],type="l",col="black",xlab="year",ylab="med")
abline(model,col="red")
diff.z.med<-diff(z.gerem[,6],lag=1,differences = 1)
xdiff<-c(1967:2014)
model<-lm(diff.z.med~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.med)#stationarité deterministe
PP.test(diff.z.med)#stationarité stochastique
plot(xdiff,diff.z.med,type="l",col="black",xlab="year",ylab="diff.z.med")
abline(model,col="red")

acf(diff.z.med)# reste qqchose ? +7,+16
pacf(diff.z.med)#reste qqchose ? +7

Box.test.2(diff.z.med,type="Ljung-Box",nlag=c(1:(length(diff.z.med)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.med)
plot(diff.z.med)
abline(h=0,col="red")

jarque.bera.test(diff.z.med)#ne suit pas une loi normale
shapiro.test(diff.z.med)#suit une loi normale

t.test(diff.z.med,mu=0)#moyenne=0
wilcox.test(diff.z.med,mu=0)#moyenne=0

##################extract white noise from Rglobal
x<-c(1966:2014)
model<-lm(z.gerem[,7]~x)
summary(model)# tendance
MannKendall(z.gerem[,7])#tendance
PP.test(z.gerem[,7])#pas de stationarité stochastique
plot(x,z.gerem[,7],type="l",col="black",xlab="year",ylab="rglob")
abline(model,col="red")
diff.z.rglob<-diff(z.gerem[,7],lag=1,differences = 1)
xdiff<-c(1967:2014)
model<-lm(diff.z.rglob~xdiff)
summary(model)#plus de tendance
MannKendall(diff.z.rglob)#stationarité deterministe
PP.test(diff.z.rglob)#stationarité stochastique
plot(xdiff,diff.z.rglob,type="l",col="black",xlab="year",ylab="diff.z.rglob")
abline(model,col="red")

acf(diff.z.rglob)#MA=4
pacf(diff.z.rglob)#idem

Box.test.2(diff.z.rglob,type="Ljung-Box",nlag=c(1:(length(diff.z.rglob)/4)),decim=3)#residus non autocorrélés+variance constante

hist(diff.z.rglob)
plot(diff.z.rglob)
abline(h=0,col="red")

jarque.bera.test(diff.z.rglob)#suit une loi normale
shapiro.test(diff.z.rglob)#suit une loi normale

t.test(diff.z.rglob,mu=0)#moyenne=0


########## correlations CCF
ccf(x=diff.z.gsi,y=diff.z.BI,type="correlation",plot=T)#pas de correlation
ccf(x=diff.z.gsi,y=diff.z.atlf,type="correlation",plot=T)#correlation positive ? +7
ccf(x=diff.z.gsi,y=residus_ns,type="correlation",plot=T)# correlation positive ? +6
ccf(x=diff.z.gsi,y=diff.z.manche,type="correlation",plot=T)# pas d'autocorrelation
ccf(x=diff.z.gsi,y=diff.z.ib,type="correlation",plot=T)# correlation positive ? +7
ccf(x=diff.z.gsi,y=diff.z.med,type="correlation",plot=T)# pas d'autocorrelation
#ccf(x=diff.z.gsi,y=diff.z.rglob,type="correlation",plot=T)# correlation positive ? +7

#########pearson correlations coeff: pas de correlations at all !!
cor.test(x=residus_gsi2, y=diff.z.BI,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3, y=diff.z.BI,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi2,y=diff.z.atlf,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3,y=diff.z.atlf,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi2,y=residus_ns[2:49],alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3,y=residus_ns[2:49],alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi2, y=diff.z.manche,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3, y=diff.z.manche,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi2, y=diff.z.ib,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3, y=diff.z.ib,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi2, y=diff.z.med,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3, y=diff.z.med,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi2, y=diff.z.rglob,alternative ="two.sided",method = "pearson")
cor.test(x=residus_gsi3, y=diff.z.rglob,alternative ="two.sided",method = "pearson")
