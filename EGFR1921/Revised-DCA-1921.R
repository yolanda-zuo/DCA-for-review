# setwd("C:\\Users\\dell\\Desktop\\??ѯ\\DCA")
#####################????ѵ��??????֤??########################
# data<-read.csv("C:/Users/zuoya/Downloads/DCA/DCA/DCA.csv",header=T)
data<-read.csv("DCA-383CASES-1921INTER1.csv",header=T)
library(rmda)
DCA<- decision_curve(label~NB_ADB,data = data,
family = binomial(link ='logit'),

thresholds= seq(0,1, by = 0.1),

confidence.intervals =0.95,study.design = 'case-control',

population.prevalence = 0.3)

plot_decision_curve(DCA,curve.names= c('DCA'),

cost.benefit.axis =T,col = 1,

confidence.intervals =FALSE,standardize = FALSE,legend.position = "none")


for(i in 2:7)
{
fo=as.formula(paste0 ("label~",names(data)[i]))


DCA1<- decision_curve(fo,data = data,
family = binomial(link ='logit'),

thresholds= seq(0,1, by = 0.1),

confidence.intervals =0.95,study.design = 'case-control',


population.prevalence = 0.3)

lines(x=DCA1$derived.data[1:10,1],y=DCA1$derived.data[1:10,6],type="l",col=i,lwd=2)
}

legend(0.7,0.3,c("NB_ADB","KNN_RF","LR_RF","RFFI_LGBM","RF_RF","Stacking_RF","SVM_LGBM","All","None"),
       col=c(1:7,"grey","black"),ncol=1,lwd=c(1,2,2,2,2,1,2,1,1),bty="n")

