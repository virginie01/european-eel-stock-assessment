SST<-read.table(file="SST.csv",header=T,sep=";",dec=".",row.names=1)
gerem<-read.table(file="fit7gerem.csv",header=T,sep=";",dec=".",row.names=1)

###log transformation + standardisation gerem series
gerem<-gerem[,-7]
gerem<-log(gerem[,])

moy_gerem<-matrix(nrow=6,ncol=1)
sigma_gerem<-matrix(nrow=6,ncol=1)
for(i in 1:ncol(gerem)){
  moy_gerem[i]<-mean(gerem[,i],na.rm=T)
  sigma_gerem[i]<-var(gerem[,i],na.rm=T)
}

z.gerem=matrix(nrow=56,ncol=6)
for(i in 1:ncol(gerem)){
  z.gerem[,i]<-(gerem[,i]-moy_gerem[i])*(1/sigma_gerem[i])
}
colnames(z.gerem)<-colnames(gerem)
rownames(z.gerem)<-rownames(gerem)

### suppression première colonne SST
SST<-SST[,-1]

### standardisation SST series

moy_SST<-matrix(nrow=5,ncol=1)
sigma_SST<-matrix(nrow=5,ncol=1)
for(i in 1:ncol(SST)){
  moy_SST[i]<-mean(SST[,i])
  sigma_SST[i]<-var(SST[,i])
}

z.SST=matrix(nrow=56,ncol=5)
for(i in 1:ncol(SST)){
  z.SST[,i]<-(SST[,i]-moy_SST[i])*(1/sigma_SST[i])
}
colnames(z.SST)<-colnames(SST)
rownames(z.SST)<-rownames(SST)

###merge des deux tableaux
table<-cbind(z.gerem,z.SST)

###5 year MA for all series
library(forecast)

plot(table[,1])
sm_R1 <- ma(table[,1],order=5)
lines(sm_R1,col="red")

plot(table[,2])
sm_R2 <- ma(table[,2],order=5)
lines(sm_R2,col="red")

plot(table[,3])
sm_R3 <- ma(table[,3],order=5)
lines(sm_R3,col="red")

plot(table[,4])
sm_R4 <- ma(table[,4],order=5)
lines(sm_R4,col="red")

plot(table[,5])
sm_R5 <- ma(table[,5],order=5)
lines(sm_R5,col="red")

plot(table[,6])
sm_R6 <- ma(table[,6],order=5)
lines(sm_R6,col="red")

plot(table[,7])
sm_sst1 <- ma(table[,7],order=5)
lines(sm_sst1,col="red")

plot(table[,8])
sm_sst2 <- ma(table[,8],order=5)
lines(sm_sst2,col="red")

plot(table[,9])
sm_sst3 <- ma(table[,9],order=5)
lines(sm_sst3,col="red")

plot(table[,10])
sm_sst4 <- ma(table[,10],order=5)
lines(sm_sst4,col="red")

plot(table[,11])
sm_sst5 <- ma(table[,11],order=5)
lines(sm_sst5,col="red")

sm_R1=as.vector(sm_R1)
sm_R2=as.vector(sm_R2)
sm_R3=as.vector(sm_R3)
sm_R4=as.vector(sm_R4)
sm_R5=as.vector(sm_R5)
sm_R6=as.vector(sm_R6)
sm_sst1=as.vector(sm_sst1)
sm_sst2=as.vector(sm_sst2)
sm_sst3=as.vector(sm_sst3)
sm_sst4=as.vector(sm_sst4)
sm_sst5=as.vector(sm_sst5)

####creation d'une matrice avec ma data: données de 1962 à 2013

matrix_ma <- matrix(c(sm_R1,sm_R2,sm_R3,sm_R4,sm_R5,sm_R6,sm_sst1,sm_sst2,sm_sst3,sm_sst4,sm_sst5), nrow=56, ncol=11, byrow=FALSE)
colnames(matrix_ma)=colnames(table)
rownames(matrix_ma)=rownames(table)
matrix_ma<-matrix_ma[-c(1,2,55,56),]

########### correlations
###########

###Rzone1
cor.test(matrix_ma[,7],matrix_ma[,1],alternative ="two.sided",method = "pearson")#correlation+++
cor.test(matrix_ma[,8],matrix_ma[,1],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,9],matrix_ma[,1],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,10],matrix_ma[,1],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,11],matrix_ma[,1],alternative ="two.sided",method = "pearson")#correlation

###Rzone2
cor.test(matrix_ma[,7],matrix_ma[,2],alternative ="two.sided",method = "pearson")#correlation+++
cor.test(matrix_ma[,8],matrix_ma[,2],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,9],matrix_ma[,2],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,10],matrix_ma[,2],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,11],matrix_ma[,2],alternative ="two.sided",method = "pearson")#correlation

###Rzone3
cor.test(matrix_ma[,7],matrix_ma[,3],alternative ="two.sided",method = "pearson")#correlation+++
cor.test(matrix_ma[,8],matrix_ma[,3],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,9],matrix_ma[,3],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,10],matrix_ma[,3],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,11],matrix_ma[,3],alternative ="two.sided",method = "pearson")#correlation

###Rzone4
cor.test(matrix_ma[,7],matrix_ma[,4],alternative ="two.sided",method = "pearson")#correlation+++
cor.test(matrix_ma[,8],matrix_ma[,4],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,9],matrix_ma[,4],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,10],matrix_ma[,4],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,11],matrix_ma[,4],alternative ="two.sided",method = "pearson")#correlation

###Rzone5
cor.test(matrix_ma[,7],matrix_ma[,5],alternative ="two.sided",method = "pearson")#correlation+++
cor.test(matrix_ma[,8],matrix_ma[,5],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,9],matrix_ma[,5],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,10],matrix_ma[,5],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,11],matrix_ma[,5],alternative ="two.sided",method = "pearson")#correlation

###Rzone6
cor.test(matrix_ma[,7],matrix_ma[,6],alternative ="two.sided",method = "pearson")#correlation+++
cor.test(matrix_ma[,8],matrix_ma[,6],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,9],matrix_ma[,6],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,10],matrix_ma[,6],alternative ="two.sided",method = "pearson")#correlation
cor.test(matrix_ma[,11],matrix_ma[,6],alternative ="two.sided",method = "pearson")#correlation

############################### degree of freedom
###############################
N=52
jtot=10
######## calcul d'autocorrelations lag 1:10 pour chaque sÃ©rie

###############Rzone1 autocorrelations 1:jtot

r_R1=rep(0,jtot)
num=0
denom=0
R1_moy=mean(matrix_ma[,1])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,1]-R1_moy)*(matrix_ma[i+j,1]-R1_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,1]-R1_moy)^2
  }
  r_R1[j]=(N/(N-j))*(num/denom)
}

###############Rzone2 autocorrelations 1:jtot

r_R2=rep(0,jtot)
num=0
denom=0
R2_moy=mean(matrix_ma[,2])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,2]-R2_moy)*(matrix_ma[i+j,2]-R2_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,2]-R2_moy)^2
  }
  r_R2[j]=(N/(N-j))*(num/denom)
}

###############Rzone3 autocorrelations 1:jtot

r_R3=rep(0,jtot)
num=0
denom=0
R3_moy=mean(matrix_ma[,3])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,3]-R3_moy)*(matrix_ma[i+j,3]-R3_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,3]-R3_moy)^2
  }
  r_R3[j]=(N/(N-j))*(num/denom)
}

###############Rzone4 autocorrelations 1:jtot

r_R4=rep(0,jtot)
num=0
denom=0
R4_moy=mean(matrix_ma[,4])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,4]-R4_moy)*(matrix_ma[i+j,4]-R4_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,4]-R4_moy)^2
  }
  r_R4[j]=(N/(N-j))*(num/denom)
}

###############Rzone5 autocorrelations 1:jtot

r_R5=rep(0,jtot)
num=0
denom=0
R5_moy=mean(matrix_ma[,5])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,5]-R5_moy)*(matrix_ma[i+j,5]-R5_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,5]-R5_moy)^2
  }
  r_R5[j]=(N/(N-j))*(num/denom)
}

###############Rzone6 autocorrelations 1:jtot

r_R6=rep(0,jtot)
num=0
denom=0
R6_moy=mean(matrix_ma[,6])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,6]-R6_moy)*(matrix_ma[i+j,6]-R6_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,6]-R6_moy)^2
  }
  r_R6[j]=(N/(N-j))*(num/denom)
}

###############r_sst1 autocorrelations 1:jtot

r_sst1=rep(0,jtot)
num=0
denom=0
sst1_moy=mean(matrix_ma[,7])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,7]-sst1_moy)*(matrix_ma[i+j,7]-sst1_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,7]-sst1_moy)^2
  }
  r_sst1[j]=(N/(N-j))*(num/denom)
}

###############r_sst2 autocorrelations 1:jtot

r_sst2=rep(0,jtot)
num=0
denom=0
sst2_moy=mean(matrix_ma[,8])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,8]-sst2_moy)*(matrix_ma[i+j,8]-sst2_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,8]-sst2_moy)^2
  }
  r_sst2[j]=(N/(N-j))*(num/denom)
}

###############r_sst3 autocorrelations 1:jtot

r_sst3=rep(0,jtot)
num=0
denom=0
sst3_moy=mean(matrix_ma[,9])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,9]-sst3_moy)*(matrix_ma[i+j,9]-sst3_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,9]-sst3_moy)^2
  }
  r_sst3[j]=(N/(N-j))*(num/denom)
}

###############r_sst4 autocorrelations 1:jtot

r_sst4=rep(0,jtot)
num=0
denom=0
sst4_moy=mean(matrix_ma[,10])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,10]-sst4_moy)*(matrix_ma[i+j,10]-sst4_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,10]-sst4_moy)^2
  }
  r_sst4[j]=(N/(N-j))*(num/denom)
}

###############r_sst5 autocorrelations 1:jtot

r_sst5=rep(0,jtot)
num=0
denom=0
sst5_moy=mean(matrix_ma[,11])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,11]-sst5_moy)*(matrix_ma[i+j,11]-sst5_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,11]-sst5_moy)^2
  }
  r_sst5[j]=(N/(N-j))*(num/denom)
}

############################################
############################################ autocorrelations corrigÃ©es

###########Rzone1/sst1
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_sst1[i])
}
df_inv=(1/N)+((2/N)*s)
df_11=1/(df_inv)#3.14306
r_11=cor.test(matrix_ma[,7],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_11=(r_11)/sqrt((1-(r_11)^2)/((df_11)-2))#-1.798574
###########Rzone1/sst2
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_sst2[i])
}
df_inv=(1/N)+((2/N)*s)
df_21=1/(df_inv)#3.195541
r_21=cor.test(matrix_ma[,8],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_21=(r_21)/sqrt((1-(r_21)^2)/((df_21)-2))#-1.833425

###########Rzone1/sst3
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_sst3[i])
}
df_inv=(1/N)+((2/N)*s)
df_31=1/(df_inv)#3.249987
r_31=cor.test(matrix_ma[,9],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_31=(r_31)/sqrt((1-(r_31)^2)/((df_31)-2))#-1.835556 

###########Rzone1/sst4
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_sst4[i])
}
df_inv=(1/N)+((2/N)*s)
df_41=1/(df_inv)#3.140371
r_41=cor.test(matrix_ma[,10],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_41=(r_41)/sqrt((1-(r_41)^2)/((df_41)-2))#-1.835493

###########Rzone1/sst5
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_sst5[i])
}
df_inv=(1/N)+((2/N)*s)
df_51=1/(df_inv)#3.137181
r_51=cor.test(matrix_ma[,11],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_51=(r_51)/sqrt((1-(r_51)^2)/((df_51)-2))#-1.872897

###########Rzone2/sst1
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_sst1[i])
}
df_inv=(1/N)+((2/N)*s)
df_12=1/(df_inv)#2.991495
r_12=cor.test(matrix_ma[,7],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_12=(r_12)/sqrt((1-(r_12)^2)/((df_12)-2))#-1.788143

###########Rzone2/sst2
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_sst2[i])
}
df_inv=(1/N)+((2/N)*s)
df_22=1/(df_inv)#3.04279
r_22=cor.test(matrix_ma[,8],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_22=(r_22)/sqrt((1-(r_22)^2)/((df_22)-2))#-1.71265

###########Rzone2/sst3
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_sst3[i])
}
df_inv=(1/N)+((2/N)*s)
df_32=1/(df_inv)#3.096134
r_32=cor.test(matrix_ma[,9],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_32=(r_32)/sqrt((1-(r_32)^2)/((df_32)-2))#-1.62746

###########Rzone2/sst4
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_sst4[i])
}
df_inv=(1/N)+((2/N)*s)
df_42=1/(df_inv)#2.989374
r_42=cor.test(matrix_ma[,10],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_42=(r_42)/sqrt((1-(r_42)^2)/((df_42)-2))#-1.767973

###########Rzone2/sst5
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_sst5[i])
}
df_inv=(1/N)+((2/N)*s)
df_52=1/(df_inv)# 2.986686
r_52=cor.test(matrix_ma[,11],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_52=(r_52)/sqrt((1-(r_52)^2)/((df_52)-2))#-1.749136


###########Rzone3/sst1
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_sst1[i])
}
df_inv=(1/N)+((2/N)*s)
df_13=1/(df_inv)#2.938371
r_13=cor.test(matrix_ma[,7],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_13=(r_13)/sqrt((1-(r_13)^2)/((df_13)-2))#-1.402251

###########Rzone3/sst2
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_sst2[i])
}
df_inv=(1/N)+((2/N)*s)
df_23=1/(df_inv)#2.988997
r_23=cor.test(matrix_ma[,8],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_23=(r_23)/sqrt((1-(r_23)^2)/((df_23)-2))#-1.242367

###########Rzone3/sst3
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_sst3[i])
}
df_inv=(1/N)+((2/N)*s)
df_33=1/(df_inv)#3.041672
r_33=cor.test(matrix_ma[,9],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_33=(r_33)/sqrt((1-(r_33)^2)/((df_33)-2))#-1.107044

###########Rzone3/sst4
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_sst4[i])
}
df_inv=(1/N)+((2/N)*s)
df_43=1/(df_inv)#2.93635
r_43=cor.test(matrix_ma[,10],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_43=(r_43)/sqrt((1-(r_43)^2)/((df_43)-2))#-1.32105

###########Rzone3/sst5
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_sst5[i])
}
df_inv=(1/N)+((2/N)*s)
df_53=1/(df_inv)#2.933753
r_53=cor.test(matrix_ma[,11],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_53=(r_53)/sqrt((1-(r_53)^2)/((df_53)-2))#-1.247611


###########Rzone4/sst1
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_sst1[i])
}
df_inv=(1/N)+((2/N)*s)
df_14=1/(df_inv)#3.003549
r_14=cor.test(matrix_ma[,7],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_14=(r_14)/sqrt((1-(r_14)^2)/((df_14)-2))#-1.197812

###########Rzone4/sst2
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_sst2[i])
}
df_inv=(1/N)+((2/N)*s)
df_24=1/(df_inv)#3.054962
r_24=cor.test(matrix_ma[,8],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_24=(r_24)/sqrt((1-(r_24)^2)/((df_24)-2))#-1.091363 

###########Rzone4/sst3
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_sst3[i])
}
df_inv=(1/N)+((2/N)*s)
df_34=1/(df_inv)#3.10842
r_34=cor.test(matrix_ma[,9],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_34=(r_34)/sqrt((1-(r_34)^2)/((df_34)-2))#-0.9993735

###########Rzone4/sst4
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_sst4[i])
}
df_inv=(1/N)+((2/N)*s)
df_44=1/(df_inv)#3.001393
r_44=cor.test(matrix_ma[,10],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_44=(r_44)/sqrt((1-(r_44)^2)/((df_44)-2))#-1.142741


###########Rzone4/sst5
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_sst5[i])
}
df_inv=(1/N)+((2/N)*s)
df_54=1/(df_inv)#2.998676
r_54=cor.test(matrix_ma[,11],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_54=(r_54)/sqrt((1-(r_54)^2)/((df_54)-2))#-1.093601


###########Rzone5/sst1
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_sst1[i])
}
df_inv=(1/N)+((2/N)*s)
df_15=1/(df_inv)#2.894523
r_15=cor.test(matrix_ma[,7],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_15=(r_15)/sqrt((1-(r_15)^2)/((df_15)-2))#-2.156966

###########Rzone5/sst2
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_sst2[i])
}
df_inv=(1/N)+((2/N)*s)
df_25=1/(df_inv)# 2.944438
r_25=cor.test(matrix_ma[,8],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_25=(r_25)/sqrt((1-(r_25)^2)/((df_25)-2))#-2.202645

###########Rzone5/sst3
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_sst3[i])
}
df_inv=(1/N)+((2/N)*s)
df_35=1/(df_inv)#2.996387
r_35=cor.test(matrix_ma[,9],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_35=(r_35)/sqrt((1-(r_35)^2)/((df_35)-2))#-2.159344

###########Rzone5/sst4
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_sst4[i])
}
df_inv=(1/N)+((2/N)*s)
df_45=1/(df_inv)# 2.892519
r_45=cor.test(matrix_ma[,10],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_45=(r_45)/sqrt((1-(r_45)^2)/((df_45)-2))#-2.230818 

###########Rzone5/sst5
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_sst5[i])
}
df_inv=(1/N)+((2/N)*s)
df_55=1/(df_inv)#2.889943
r_55=cor.test(matrix_ma[,11],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_55=(r_55)/sqrt((1-(r_55)^2)/((df_55)-2))# -2.297919



###########Rzone6/sst1
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_sst1[i])
}
df_inv=(1/N)+((2/N)*s)
df_16=1/(df_inv)#3.063152
r_16=cor.test(matrix_ma[,7],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_16=(r_16)/sqrt((1-(r_16)^2)/((df_16)-2))#-1.098128

###########Rzone6/sst2
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_sst2[i])
}
df_inv=(1/N)+((2/N)*s)
df_26=1/(df_inv)#3.115226
r_26=cor.test(matrix_ma[,8],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_26=(r_26)/sqrt((1-(r_26)^2)/((df_26)-2))#-1.008873

###########Rzone6/sst3
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_sst3[i])
}
df_inv=(1/N)+((2/N)*s)
df_36=1/(df_inv)#3.169326
r_36=cor.test(matrix_ma[,9],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_36=(r_36)/sqrt((1-(r_36)^2)/((df_36)-2))#-0.9368924

###########Rzone6/sst4
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_sst4[i])
}
df_inv=(1/N)+((2/N)*s)
df_46=1/(df_inv)#3.060857
r_46=cor.test(matrix_ma[,10],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_46=(r_46)/sqrt((1-(r_46)^2)/((df_46)-2))#-1.051339

###########Rzone6/sst5
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_sst5[i])
}
df_inv=(1/N)+((2/N)*s)
df_56=1/(df_inv)#3.058018
r_56=cor.test(matrix_ma[,11],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_56=(r_56)/sqrt((1-(r_56)^2)/((df_56)-2))#-1.011912


