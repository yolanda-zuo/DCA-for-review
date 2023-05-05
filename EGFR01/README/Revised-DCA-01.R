# setwd("C:\\Users\\dell\\Desktop\\??ѯ\\DCA")
#####################????ѵ��??????֤??########################
# data<-read.csv("C:/Users/zuoya/Downloads/DCA/DCA/DCA.csv",header=T)
data<-read.csv("DCA-383CASES-01INTER.csv",header=T)

library(rmda)



DCA<- decision_curve(label~KNN_XGB,data = data,
family = binomial(link ='logit'),

thresholds= seq(0,1, by = 0.1),

confidence.intervals =0.95,study.design = 'case-control',

population.prevalence = 0.2)

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

population.prevalence = 0.2)

lines(x=DCA1$derived.data[1:10,1],y=DCA1$derived.data[1:10,6],type="l",col=i,lwd=2)
}


###



legend(0.60,0.2,c("KNN_XGB","LR_ADB","NB_LR","RF_XGB","RFFI_LGBM","Stacking_LGBM","SVM_GBDT","All","None"),
       col=c(1:7,"grey","black"),ncol=1,lwd=c(2,2,2,2,2,2,2,1,1),bty="n")

