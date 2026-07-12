###import data
GSI<-read.table(file="GSI.csv",header=T,sep=";",dec=".",row.names=1)
gerem<-read.table(file="fit7gerem.csv",header=T,sep=";",dec=".",row.names=1)

### GSI : 1969 a 2015
GSI<-GSI[4:50,-1]
###standardisation GSI
moy_GSI<-matrix(nrow=5,ncol=1)
sigma_GSI<-matrix(nrow=5,ncol=1)
for(i in 1:ncol(GSI)){
  moy_GSI[i]<-mean(GSI[,i])
  sigma_GSI[i]<-var(GSI[,i])
}

z.GSI=matrix(nrow=47,ncol=5)
for(i in 1:ncol(GSI)){
  z.GSI[,i]<-(GSI[,i]-moy_GSI[i])*(1/sigma_GSI[i])
}
colnames(z.GSI)<-colnames(GSI)
rownames(z.GSI)<-rownames(GSI)


###log transformation + standardisation gerem series
gerem<-gerem[10:56,-7]
gerem<-log(gerem[,])

moy_gerem<-matrix(nrow=6,ncol=1)
sigma_gerem<-matrix(nrow=6,ncol=1)
for(i in 1:ncol(gerem)){
  moy_gerem[i]<-mean(gerem[,i],na.rm=T)
  sigma_gerem[i]<-var(gerem[,i],na.rm=T)
}

z.gerem=matrix(nrow=47,ncol=6)
for(i in 1:ncol(gerem)){
  z.gerem[,i]<-(gerem[,i]-moy_gerem[i])*(1/sigma_gerem[i])
}
colnames(z.gerem)<-colnames(gerem)
rownames(z.gerem)<-rownames(gerem)

###merge des deux tableaux
table<-cbind(z.gerem,z.GSI)

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
sm_gsi1 <- ma(table[,7],order=5)
lines(sm_gsi1,col="red")

plot(table[,8])
sm_gsi2 <- ma(table[,8],order=5)
lines(sm_gsi2,col="red")

plot(table[,9])
sm_gsi3 <- ma(table[,9],order=5)
lines(sm_gsi3,col="red")

plot(table[,10])
sm_gsi4 <- ma(table[,10],order=5)
lines(sm_gsi4,col="red")

plot(table[,11])
sm_gsi5 <- ma(table[,11],order=5)
lines(sm_gsi5,col="red")

sm_R1=as.vector(sm_R1)
sm_R2=as.vector(sm_R2)
sm_R3=as.vector(sm_R3)
sm_R4=as.vector(sm_R4)
sm_R5=as.vector(sm_R5)
sm_R6=as.vector(sm_R6)
sm_gsi1=as.vector(sm_gsi1)
sm_gsi2=as.vector(sm_gsi2)
sm_gsi3=as.vector(sm_gsi3)
sm_gsi4=as.vector(sm_gsi4)
sm_gsi5=as.vector(sm_gsi5)

####creation d'une matrice avec ma data

matrix_ma <- matrix(c(sm_R1,sm_R2,sm_R3,sm_R4,sm_R5,sm_R6,sm_gsi1,sm_gsi2,sm_gsi3,sm_gsi4,sm_gsi5), nrow=47, ncol=11, byrow=FALSE)
colnames(matrix_ma)=colnames(table)

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
matrix_ma<-matrix_ma[-c(1,2,46,47),]# enlever NA dus a ma model
N=43
jtot=9
######## calcul d'autocorrelations lag 1:9 pour chaque série

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

###############r_gsi1 autocorrelations 1:jtot

r_gsi1=rep(0,jtot)
num=0
denom=0
gsi1_moy=mean(matrix_ma[,7])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,7]-gsi1_moy)*(matrix_ma[i+j,7]-gsi1_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,7]-gsi1_moy)^2
  }
  r_gsi1[j]=(N/(N-j))*(num/denom)
}

###############r_amo2 autocorrelations 1:jtot

r_gsi2=rep(0,jtot)
num=0
denom=0
gsi2_moy=mean(matrix_ma[,8])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,8]-gsi2_moy)*(matrix_ma[i+j,8]-gsi2_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,8]-gsi2_moy)^2
  }
  r_gsi2[j]=(N/(N-j))*(num/denom)
}

###############r_amo3 autocorrelations 1:jtot

r_gsi3=rep(0,jtot)
num=0
denom=0
gsi3_moy=mean(matrix_ma[,9])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,9]-gsi3_moy)*(matrix_ma[i+j,9]-gsi3_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,9]-gsi3_moy)^2
  }
  r_gsi3[j]=(N/(N-j))*(num/denom)
}

###############r_amo4 autocorrelations 1:jtot

r_gsi4=rep(0,jtot)
num=0
denom=0
gsi4_moy=mean(matrix_ma[,10])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,10]-gsi4_moy)*(matrix_ma[i+j,10]-gsi4_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,10]-gsi4_moy)^2
  }
  r_gsi4[j]=(N/(N-j))*(num/denom)
}

###############r_amo5 autocorrelations 1:jtot

r_gsi5=rep(0,jtot)
num=0
denom=0
gsi5_moy=mean(matrix_ma[,11])
for(j in 1:jtot){
  for (i in 1:(N-j)){
    num=num+((matrix_ma[i,11]-gsi5_moy)*(matrix_ma[i+j,11]-gsi5_moy))
  }
  for(i in 1:N){
    denom=denom+(matrix_ma[i,11]-gsi5_moy)^2
  }
  r_gsi5[j]=(N/(N-j))*(num/denom)
}

############################################
############################################ autocorrelations corrigées

###########Rzone1/gsi1
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_gsi1[i])
}
df_inv=(1/N)+((2/N)*s)
df_11=1/(df_inv)#3.182381
r_11=cor.test(matrix_ma[,7],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_11=(r_11)/sqrt((1-(r_11)^2)/((df_11)-2))#-0.4512083
###########Rzone1/gsi2
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_gsi2[i])
}
df_inv=(1/N)+((2/N)*s)
df_21=1/(df_inv)#3.081533
r_21=cor.test(matrix_ma[,8],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_21=(r_21)/sqrt((1-(r_21)^2)/((df_21)-2))#-0.4582895

###########Rzone1/gsi3
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_gsi3[i])
}
df_inv=(1/N)+((2/N)*s)
df_31=1/(df_inv)#3.060184
r_31=cor.test(matrix_ma[,9],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_31=(r_31)/sqrt((1-(r_31)^2)/((df_31)-2))#-0.4822426

###########Rzone1/gsi4
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_gsi4[i])
}
df_inv=(1/N)+((2/N)*s)
df_41=1/(df_inv)#3.058439
r_41=cor.test(matrix_ma[,10],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_41=(r_41)/sqrt((1-(r_41)^2)/((df_41)-2))#-0.4474352

###########Rzone1/gsi5
s=0
for(i in 1:jtot){
  s=s+(r_R1[i]*r_gsi5[i])
}
df_inv=(1/N)+((2/N)*s)
df_51=1/(df_inv)#2.942071
r_51=cor.test(matrix_ma[,11],matrix_ma[,1],alternative ="two.sided",method = "pearson")$estimate
t_obs_51=(r_51)/sqrt((1-(r_51)^2)/((df_51)-2))#-0.4462883

###########Rzone2/gsi1
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_gsi1[i])
}
df_inv=(1/N)+((2/N)*s)
df_12=1/(df_inv)#3.105235
r_12=cor.test(matrix_ma[,7],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_12=(r_12)/sqrt((1-(r_12)^2)/((df_12)-2))#-0.6784081 

###########Rzone2/gsi2
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_gsi2[i])
}
df_inv=(1/N)+((2/N)*s)
df_22=1/(df_inv)#3.006078
r_22=cor.test(matrix_ma[,8],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_22=(r_22)/sqrt((1-(r_22)^2)/((df_22)-2))#-0.6908872 

###########Rzone2/gsi3
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_gsi3[i])
}
df_inv=(1/N)+((2/N)*s)
df_32=1/(df_inv)#2.985091
r_32=cor.test(matrix_ma[,9],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_32=(r_32)/sqrt((1-(r_32)^2)/((df_32)-2))#-0.7218308

###########Rzone2/gsi4
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_gsi4[i])
}
df_inv=(1/N)+((2/N)*s)
df_42=1/(df_inv)#2.983505
r_42=cor.test(matrix_ma[,10],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_42=(r_42)/sqrt((1-(r_42)^2)/((df_42)-2))#-0.6748201 

###########Rzone2/gsi5
s=0
for(i in 1:jtot){
  s=s+(r_R2[i]*r_gsi5[i])
}
df_inv=(1/N)+((2/N)*s)
df_52=1/(df_inv)#2.869151
r_52=cor.test(matrix_ma[,11],matrix_ma[,2],alternative ="two.sided",method = "pearson")$estimate
t_obs_52=(r_52)/sqrt((1-(r_52)^2)/((df_52)-2))#-0.6738171


###########Rzone3/gsi1
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_gsi1[i])
}
df_inv=(1/N)+((2/N)*s)
df_13=1/(df_inv)#3.155675
r_13=cor.test(matrix_ma[,7],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_13=(r_13)/sqrt((1-(r_13)^2)/((df_13)-2))#-0.8621053

###########Rzone3/gsi2
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_gsi2[i])
}
df_inv=(1/N)+((2/N)*s)
df_23=1/(df_inv)#3.055323
r_23=cor.test(matrix_ma[,8],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_23=(r_23)/sqrt((1-(r_23)^2)/((df_23)-2))#-0.8700441

###########Rzone3/gsi3
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_gsi3[i])
}
df_inv=(1/N)+((2/N)*s)
df_33=1/(df_inv)#3.03408
r_33=cor.test(matrix_ma[,9],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_33=(r_33)/sqrt((1-(r_33)^2)/((df_33)-2))#-0.8683933

###########Rzone3/gsi4
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_gsi4[i])
}
df_inv=(1/N)+((2/N)*s)
df_43=1/(df_inv)#3.032396
r_43=cor.test(matrix_ma[,10],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_43=(r_43)/sqrt((1-(r_43)^2)/((df_43)-2))#-0.8573993

###########Rzone3/gsi5
s=0
for(i in 1:jtot){
  s=s+(r_R3[i]*r_gsi5[i])
}
df_inv=(1/N)+((2/N)*s)
df_53=1/(df_inv)#2.916611
r_53=cor.test(matrix_ma[,11],matrix_ma[,3],alternative ="two.sided",method = "pearson")$estimate
t_obs_53=(r_53)/sqrt((1-(r_53)^2)/((df_53)-2))#-0.8476813


###########Rzone4/gsi1
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_gsi1[i])
}
df_inv=(1/N)+((2/N)*s)
df_14=1/(df_inv)#3.000842
r_14=cor.test(matrix_ma[,7],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_14=(r_14)/sqrt((1-(r_14)^2)/((df_14)-2))#-0.7209708 

###########Rzone4/gsi2
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_gsi2[i])
}
df_inv=(1/N)+((2/N)*s)
df_24=1/(df_inv)#2.904256
r_24=cor.test(matrix_ma[,8],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_24=(r_24)/sqrt((1-(r_24)^2)/((df_24)-2))#-0.7300666

###########Rzone4/gsi3
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_gsi3[i])
}
df_inv=(1/N)+((2/N)*s)
df_34=1/(df_inv)#2.883818
r_34=cor.test(matrix_ma[,9],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_34=(r_34)/sqrt((1-(r_34)^2)/((df_34)-2))#-0.7522724

###########Rzone4/gsi4
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_gsi4[i])
}
df_inv=(1/N)+((2/N)*s)
df_44=1/(df_inv)#2.882417
r_44=cor.test(matrix_ma[,10],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_44=(r_44)/sqrt((1-(r_44)^2)/((df_44)-2))#-0.7142078


###########Rzone4/gsi5
s=0
for(i in 1:jtot){
  s=s+(r_R4[i]*r_gsi5[i])
}
df_inv=(1/N)+((2/N)*s)
df_54=1/(df_inv)#2.771127
r_54=cor.test(matrix_ma[,11],matrix_ma[,4],alternative ="two.sided",method = "pearson")$estimate
t_obs_54=(r_54)/sqrt((1-(r_54)^2)/((df_54)-2))#-0.7075887


###########Rzone5/gsi1
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_gsi1[i])
}
df_inv=(1/N)+((2/N)*s)
df_15=1/(df_inv)#2.976417
r_15=cor.test(matrix_ma[,7],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_15=(r_15)/sqrt((1-(r_15)^2)/((df_15)-2))#-0.516722

###########Rzone5/gsi2
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_gsi2[i])
}
df_inv=(1/N)+((2/N)*s)
df_25=1/(df_inv)#2.880649
r_25=cor.test(matrix_ma[,8],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_25=(r_25)/sqrt((1-(r_25)^2)/((df_25)-2))#-0.5577842

###########Rzone5/gsi3
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_gsi3[i])
}
df_inv=(1/N)+((2/N)*s)
df_35=1/(df_inv)#  2.860387
r_35=cor.test(matrix_ma[,9],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_35=(r_35)/sqrt((1-(r_35)^2)/((df_35)-2))#-0.6261149

###########Rzone5/gsi4
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_gsi4[i])
}
df_inv=(1/N)+((2/N)*s)
df_45=1/(df_inv)# 2.858938
r_45=cor.test(matrix_ma[,10],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_45=(r_45)/sqrt((1-(r_45)^2)/((df_45)-2))# -0.5267455

###########Rzone5/gsi5
s=0
for(i in 1:jtot){
  s=s+(r_R5[i]*r_gsi5[i])
}
df_inv=(1/N)+((2/N)*s)
df_55=1/(df_inv)# 2.748547
r_55=cor.test(matrix_ma[,11],matrix_ma[,5],alternative ="two.sided",method = "pearson")$estimate
t_obs_55=(r_55)/sqrt((1-(r_55)^2)/((df_55)-2))# -0.5398329



###########Rzone6/gsi1
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_gsi1[i])
}
df_inv=(1/N)+((2/N)*s)
df_16=1/(df_inv)#2.972299
r_16=cor.test(matrix_ma[,7],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_16=(r_16)/sqrt((1-(r_16)^2)/((df_16)-2))#-0.8500465

###########Rzone6/gsi2
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_gsi2[i])
}
df_inv=(1/N)+((2/N)*s)
df_26=1/(df_inv)#2.876666
r_26=cor.test(matrix_ma[,8],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_26=(r_26)/sqrt((1-(r_26)^2)/((df_26)-2))#-0.9311294

###########Rzone6/gsi3
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_gsi3[i])
}
df_inv=(1/N)+((2/N)*s)
df_36=1/(df_inv)#2.856431
r_36=cor.test(matrix_ma[,9],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_36=(r_36)/sqrt((1-(r_36)^2)/((df_36)-2))#-1.02946

###########Rzone6/gsi4
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_gsi4[i])
}
df_inv=(1/N)+((2/N)*s)
df_46=1/(df_inv)#2.855
r_46=cor.test(matrix_ma[,10],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_46=(r_46)/sqrt((1-(r_46)^2)/((df_46)-2))#-0.8783046

###########Rzone6/gsi5
s=0
for(i in 1:jtot){
  s=s+(r_R6[i]*r_gsi5[i])
}
df_inv=(1/N)+((2/N)*s)
df_56=1/(df_inv)#2.744787
r_56=cor.test(matrix_ma[,11],matrix_ma[,6],alternative ="two.sided",method = "pearson")$estimate
t_obs_56=(r_56)/sqrt((1-(r_56)^2)/((df_56)-2))#-0.9092275 


