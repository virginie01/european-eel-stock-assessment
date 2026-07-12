#set working directory
setwd("/data1/bornarel/DFA2806")

rm(list=ls())
library(MARSS)
##load raw data
data<-read.table(file = "recruitment_series_DFA.csv", header = TRUE, sep = ";", dec=".",row.names = 1, encoding="latin1",check.names = FALSE)
#log-transformation des données car données lognormales
data=log(data+1)

#sauvegarde des séries fiables 
data=data[,c("Bann","Nalon","Rhine","Ijzer","Viskan","Erne","Ebrodeltalagoons","Vilaine","Severn","Albuferalagoon","Imsa","Gironde","Loire","Shannon","Minho total","Lauwersoog","Rhingals","Katwijk","AdourCP","Ems","Tiber","Stellendam","Adour","IYFS/IBTS 1","IYFS/IBTS 2","Bresle","Fremur","Vidaa","Somme","Feale","Inagh","Maigne","SevresNiortaise")]
par(mfrow=c(7,5),mar=c(0,0,0,0))
for (i in 1:ncol(data)){
  plot(data[,i],type="l",main=colnames(data)[i],ylim=c(min(data,na.rm = TRUE),max(data,na.rm=TRUE)))
}
#suppression 10 premières valeurs Minho
data[1:10,"Minho total"]=NA


#attach(data)
#names(data)
#transpose data
data<-t(data)

#Sigma<-sqrt(apply(data[,as.character(2001:2008)],1,var,na.rm=TRUE))
y.bar<-apply(data,1,mean,na.rm=TRUE)
#sigma<-sqrt(apply(data,1,var,na.rm=TRUE))
#demean time-series
recruit<-(data-y.bar)

##fusion des IYFS
#na.IYFS1<-which(is.na(recruit[19,]) & !is.na(recruit[20,]))
#na.IYFS1
#x=replace(x=recruit[19,],list=na.IYFS1,values=rep(0,length(na.IYFS1)))
#na.IYFS2<-which(is.na(recruit[20,]) & !is.na(recruit[19,]))
#na.IYFS2
#y=replace(x=recruit[20,],list=na.IYFS2,values=rep(0,length(na.IYFS2)))
#IYFS=x+y
#recruit<-rbind(recruit,IYFS)
#recruit=recruit[-c(19,20),]
#get number of time series
N.ts<-dim(recruit)[1]
#N.ts
#get length of time series
TT<-dim(recruit)[2]
#TT
#aper?u graphique
par(mfrow=c(6,5),mar=c(0,0,0,0))
for (i in 1:nrow(recruit)){
plot(recruit[i,],type="l",main=rownames(recruit)[i],ylim=c(min(recruit,na.rm = TRUE),max(recruit,na.rm=TRUE)))
}

par(mfrow=c(1,1),oma=c(1,1,0,0))
xv=colnames(recruit)[1]:colnames(recruit)[TT]
plot(xv,recruit[1,],type="l",lty=1,ylim=c(min(recruit,na.rm=T),max(recruit,na.rm=T)),xlab="Year",ylab="Recruitment time series (log)",cex.lab=0.75,cex.axis=0.75)
for (i in 2:33){
lines(xv,recruit[i,],type="l",lty=1)
}

#zones=read.table("zones_dfa.csv",sep=";",header=TRUE)

#### set up DFA model
##comparing many model structures: up to 5 trends
#set new control params
cntl.list<-list(minit=200,maxit=300000,allow.degen=FALSE)

#set up forms of R matrices
model.data<-data.frame()
#fits lots of model & store result
R="diagonal and unequal"
for(m in 1:4){
  dfa.model=list(A="unequal", R=R, m=m)
  kemz=MARSS(recruit, model=dfa.model, control=cntl.list,form="dfa",z.score=FALSE,demean=FALSE, fit=TRUE)
  model.data<-rbind(model.data,data.frame(R=R,m=m,logLik=kemz$logLik,K=kemz$num.params,AICc=kemz$AICc,stringsAsFactors=FALSE))
  assign(paste("kemz",m,R,sep="."),kemz)
}

save.image("dfa2607.RData")