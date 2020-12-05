
2018-07-8

#=====================================================================================
#
#  Code chunk 1 设置工作路径
#
#=====================================================================================


# Display the current working directory
getwd();
#setwd("C:\\Users\\Administrator\\Desktop\\samples2")
setwd("F:\\Desktop\\Data_analysis_Wang")
# If necessary, change the path below to the directory where the data files are stored. 
# "." means current directory. On Windows use a forward slash / instead of the usual \.
##设置工作目录为当前目录：
workingDir = ".";
setwd(workingDir); 

options(stringsAsFactors = FALSE)



#=====================================================================================
#
#  Code chunk 2 数据导入
#
#=====================================================================================

Input=("
Samples	Condition2	Temperature	COD	NOX	SBP	DBP	MBP	HR	BIS	CO	SVV
Sample1	A_Baseline	37.5	99	98	133	75	98	68	98	3	22
       Sample1	B_Intubation	37.3	56	68	117	75	88	70	50	2.6	19
       Sample1	C_Incision	37.3	60	78	121	72	89	71	52	2.8	20
       Sample1	D_pre-CPB15min	36.8	60	79	131	70	96	65	51	2.5	21
       Sample1	E_pre-CPB10min	36.8	60	74	122	83	93	66	57	2.9	24
       Sample1	F_pre-CPB5min	36.8	60	71	137	71	98	65	45	3.2	27
       Sample1	G_CPB	33.3	52	61	NA	NA	NA	NA	33	NA	NA
       Sample1	H_CPB5min	33.3	36	63	NA	NA	NA	NA	35	NA	NA
       Sample1	I_CPB10min	33.8	41	65	NA	NA	NA	NA	43	NA	NA
       Sample1	J_CPB15min	34.3	35	61	NA	NA	NA	NA	44	NA	NA
       Sample1	K_CPB20min	34	33	58	NA	NA	NA	NA	48	NA	NA
       Sample1	L_Post-CPB	34	46	56	118	76	88	67	51	NA	NA
       Sample1	M_Post-CPB5min	36	48	74	132	77	98	68	55	4.3	28
       Sample1	N_Post-CPB10min	36.6	64	75	133	76	97	67	56	4.3	28
       Sample1	O_Post-CPB15min	36.8	66	88	135	81	98	89	57	NA	NA
       Sample1	P_Post-CPB20min	36.5	68	89	139	78	99	70	56	2.9	26
       sample2	A_Baseline	36.6	91	97	122	60	80	69	90	NA	NA
       sample2	B_Intubation	36.6	79	90	106	59	71	61	48	3.9	14
       sample2	C_Incision	36	70	80	112	61	NA	50	49	3.8	15
       sample2	D_pre-CPB15min	34.8	52	58	125	69	83	58	41	3.4	22
       sample2	E_pre-CPB10min	34.5	42	38	103	65	76	52	39	3.5	11
       sample2	F_pre-CPB5min	34.5	40	33	110	70	82	56	38	3.4	16
       sample2	G_CPB	30.6	19	29	NA	NA	NA	NA	27	NA	NA
       sample2	H_CPB5min	31	19	38	NA	NA	NA	NA	27	NA	NA
       sample2	I_CPB10min	30.5	33	24	NA	NA	NA	NA	30	NA	NA
       sample2	J_CPB15min	31	28	26	NA	NA	NA	NA	29	NA	NA
       sample2	K_CPB20min	31	20	23	NA	NA	NA	NA	31	NA	NA
       sample2	L_Post-CPB	36	52	NA	95	69	77	65	40	2.6	13
       sample2	M_Post-CPB5min	36.5	53	68	110	70	82	65	42	2.4	13
       sample2	N_Post-CPB10min	36.5	51	69	103	65	76	66	40	4.5	17
       sample2	O_Post-CPB15min	36.6	42	68	125	69	83	93	41	4	16
       sample2	P_Post-CPB20min	36.8	51	73	86	38	56	108	45	4	13
       sample3	A_Baseline	36.5	99	99	124	67	NA	49	41	NA	NA
       sample3	B_Intubation	36.5	50	69	131	69	NA	48	41	NA	NA
       sample3	C_Incision	36.5	49	68	127	67	NA	51	38	NA	NA
       sample3	D_pre-CPB15min	35.7	56	70	130	66	NA	66	44	NA	NA
       sample3	E_pre-CPB10min	35.2	57	70	132	67	NA	88	36	NA	NA
       sample3	F_pre-CPB5min	35.2	57	69	128	70	NA	78	39	NA	NA
       sample3	G_CPB	33.15	36	39	NA	NA	NA	NA	36	NA	NA
       sample3	H_CPB5min	31.5	31	36	NA	NA	NA	NA	39	NA	NA
       sample3	I_CPB10min	31.6	35	33	NA	NA	NA	NA	40	NA	NA
       sample3	J_CPB15min	31.5	36	35	NA	NA	NA	NA	39	NA	NA
       sample3	K_CPB20min	31.5	45	40	NA	NA	NA	NA	41	NA	NA
       sample3	L_Post-CPB	35.5	55	56	125	61	NA	71	40	NA	NA
       sample3	M_Post-CPB5min	36.5	40	71	126	59	NA	65	45	NA	NA
       sample3	N_Post-CPB10min	36.5	42	75	101	52	NA	65	42	NA	NA
       sample3	O_Post-CPB15min	36.5	42	69	102	52	NA	65	42	NA	NA
       sample3	P_Post-CPB20min	36.6	42	65	108	56	NA	65	42	NA	NA
       sample4	A_Baseline	36.6	89	98	132	70	NA	81	98	NA	NA
       sample4	B_Intubation	36.6	54	84	130	67	NA	78	37	NA	NA
       sample4	C_Incision	36.5	57	88	131	66	NA	75	51	NA	NA
       sample4	D_pre-CPB15min	36.5	54	84	125	65	NA	77	38	NA	NA
       sample4	E_pre-CPB10min	36.5	56	82	130	68	NA	72	42	NA	NA
       sample4	F_pre-CPB5min	35.5	54	75	127	65	NA	72	46	NA	NA
       sample4	G_CPB	35.5	48	57	NA	NA	NA	NA	41	NA	NA
       sample4	H_CPB5min	30.5	42	57	NA	NA	NA	NA	38	NA	NA
       sample4	I_CPB10min	30.5	44	60	NA	NA	NA	NA	35	NA	NA
       sample4	J_CPB15min	30.2	40	56	NA	NA	NA	NA	38	NA	NA
       sample4	K_CPB20min	30.5	43	58	NA	NA	NA	NA	35	NA	NA
       sample4	L_Post-CPB	36.5	73	91	132	75	NA	73	58	NA	NA
       sample4	M_Post-CPB5min	36.5	67	83	130	67	NA	75	61	NA	NA
       sample4	N_Post-CPB10min	36.5	64	89	133	78	NA	70	51	NA	NA
       sample4	O_Post-CPB15min	36.5	77	87	138	70	NA	71	58	NA	NA
       sample4	P_Post-CPB20min	36.5	73	89	134	70	NA	72	45	NA	NA
       sample5	A_Baseline	36.5	99	99	167	90	NA	72	98	3.2	10
       sample5	B_Intubation	36.5	58	85	140	81	NA	62	45	3	8
       sample5	C_Incision	36.5	51	87	139	79	NA	59	42	2.9	9
       sample5	D_pre-CPB15min	36.5	56	79	145	80	104	61	54	3.8	9
       sample5	E_pre-CPB10min	35.5	44	65	112	69	80	97	58	3.6	8
       sample5	F_pre-CPB5min	35.5	49	71	157	78	100	69	60	3.8	9
       sample5	G_CPB	31.3	36	34	NA	NA	NA	NA	46	NA	NA
       sample5	H_CPB5min	31.1	39	42	NA	NA	NA	NA	45	NA	NA
       sample5	I_CPB10min	31.2	37	42	NA	NA	NA	NA	44	NA	NA
       sample5	J_CPB15min	31	37	40	NA	NA	NA	NA	50	NA	NA
       sample5	K_CPB20min	31.2	37	37	NA	NA	NA	NA	46	NA	NA
       sample5	L_Post-CPB	35	40	58	82	73	85	62	39	3.8	10
       sample5	M_Post-CPB5min	35.4	47	70	143	74	105	96	39	4	4
       sample5	N_Post-CPB10min	36.6	42	77	125	71	88	96	49	4.1	4
       sample5	O_Post-CPB15min	36.6	45	78	135	78	91	90	52	4	3
       ")
#=====================================================================================
#
#  Code chunk 3数据导入
#
#=====================================================================================

Data = read.table(textConnection(Input),header=TRUE)

#=====================================================================================
#
#  Code chunk 4 统计学描述性分析
#
#=====================================================================================

##summary(data_combine,na.rm=TRUE)  ##这个是进行总体描述
###分组进行描述性统计量，按照不同时间点进行分组分析：
#?aggregate() ##此为单返回函数，每次只返回一个简单值；

data_combine2<- Data[,c(-1,-2)]

result1<-aggregate(data_combine2,by=list(Data[,2]),mean,na.rm=TRUE) ###这个是计算前去除缺失值，保留其余值继续运算；
write.csv(result1, file="C:\\Users\\Administrator\\Desktop\\samples\\result-mean.csv")

result2<-aggregate(data_combine2,by=list(Data[,2]),sd,na.rm=TRUE) ###这个是计算前去除缺失值，保留其余值继续运算；
write.csv(result2, file="C:\\Users\\Administrator\\Desktop\\samples\\result-sd.csv")
###data_combine<-na.omit(data_combine) ###这个是删除所有缺失值所在的行，去除数据较大，不建议轻易使用；
##na.rm=TRUE这个参数在多数函数都有；

#=====================================================================================
#
#  Code chunk 5 统计学描述性分析
#
#=====================================================================================
####Temperature
if(!require(nlme)){install.packages("nlme")}
lme_fit = lme(Temperature~Condition2, data=Data,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data)
Condition2<- as.factor(Condition2)
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"), test = adjusted(type = "bonferroni"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(25,40))
detach(Data)

####COD
if(!require(nlme)){install.packages("nlme")}
Data2 <- na.omit(Data[,c(1,2,4)])
lme_fit = lme(COD~Condition2, data=Data2,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data2)
Condition2<- as.factor(na.omit(Condition2))
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"), test = adjusted(type = "bonferroni"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(10,100))
detach(Data2)



####NOX
if(!require(nlme)){install.packages("nlme")}
Data3 <- na.omit(Data[,c(1,2,5)])
lme_fit = lme(NOX~Condition2, data=Data3,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data3)
Condition2<- as.factor(na.omit(Condition2))
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(10,100))
detach(Data3)


####BIS
if(!require(nlme)){install.packages("nlme")}
Data3 <- na.omit(Data[,c(1,2,10)])
lme_fit = lme(BIS~Condition2, data=Data3,na.action=na.omit,random=~1|Samples)
anova(lme_fit)
require(multcomp)
attach(Data3)
Condition2<- as.factor(na.omit(Condition2))
class(Condition2)
par(mar=c(5,4,8,2))
tuk<-glht(lme_fit,linfct=mcp(Condition2="Tukey"))
#summary(tuk)
plot(cld(tuk,level=0.05),col="white",ylim=c(10,100))
detach(Data3)





#=====================================================================================
#
#  Code chunk 5 ##进行Pearson correlation analysis
#
#=====================================================================================
		
####pearson correlation analysis
		
		Data = read.table(textConnection(Input),header=TRUE)
		data_new2 <-Data[which(Data$Condition2!="A_Baseline"),]
		
#data_new2<- data_new[which(data_new$Name3!="A_Baseline"),]
#length(data_new2[,2])
#opar=par(mfrow=c(2,2))
		
###1) NOX
		data_2 <- data_new2[,c(3,5)]  ###提取第2和4列
		#data_2 <- data_new2[,c("Temperature","NOX")] ##同上，只是具体指名那一列
		data_2 <- na.omit(data_2)
		
		fit_NOX <- lm(NOX~Temperature, data=data_2)
		summary(fit_NOX)
		plot(data_2$Temperature,data_2$NOX,xlab="Temperature",ylab="qNOX",
		     ylim=c(10,100),col="black",pch = 21, bg = "white")
		abline(fit_NOX,col="black")
		
		#prd1 <- predict(fit_NOX,interval="confidence",level=0.95)
		#lines(data_2$Temperature,prd1[,2],lty=3,col="blue")
		#lines(data_2$Temperature,prd1[,3],lty=3,col="blue")
		
###2)COD
		data_3 <- data_new2[,c(3,4)]  ###提取第2和4列
		#data_3 <- data_new2[,c("Temperature","COD")] ##同上，只是具体指名那一列
		data_3 <- na.omit(data_3)
		
		fit_COD <- lm(COD~Temperature, data=data_3)
		summary(fit_COD)
		plot(data_3$Temperature,data_3$COD,xlab="Temperature",ylab="qCON",
		     ylim=c(10,100),col="black",pch = 21, bg = "white")
		abline(fit_COD,col="black")
		
		#prd2 <- predict(fit_COD,interval="confidence",level=0.95)
		#lines(data_3$Temperature,prd2[,2],lty=3,col="blue")
		#lines(data_3$Temperature,prd2[,3],lty=3,col="blue")
		
###3)BIS
		data_4 <- data_new2[,c(3,10)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","BIS")] ##同上，只是具体指名那一列
		data_4 <- na.omit(data_4)
		
		fit_BIS <- lm(BIS~Temperature, data=data_4)
		summary(fit_BIS)
		plot(data_4$Temperature,data_4$BIS,xlab="Temperature",ylab="BIS",
		     ylim=c(0,100),col="black",pch = 21, bg = "white")
		abline(fit_BIS,col="black")
		
#par(opar)
		
	
		
		
###5)SBP
		data_5 <- data_new2[,c(3,6)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","SBP")] ##同上，只是具体指名那一列
		data_5 <- na.omit(data_5)
		
		fit_SBP <- lm(SBP~Temperature, data=data_5)
		summary(fit_SBP)
		plot(data_5$Temperature,data_5$SBP,xlab="Temperature",ylab="SBP",
		     ylim=c(50,200),col="black",pch = 21, bg = "white")
		abline(fit_SBP,col="black")
		
		
###6)DBP
		data_6 <- data_new2[,c(3,7)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","DBP")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_DBP <- lm(DBP~Temperature, data=data_6)
		summary(fit_DBP)
		plot(data_6$Temperature,data_6$DBP,xlab="Temperature",ylab="DBP",
		     ylim=c(30,110),col="black",pch = 21, bg = "white")
		abline(fit_DBP,col="black")
		
		
		###7)MBP
		data_6 <- data_new2[,c(3,8)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","DBP")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_MBP <- lm(MBP~Temperature, data=data_6)
		summary(fit_MBP)
		plot(data_6$Temperature,data_6$MBP,xlab="Temperature",ylab="MBP",
		     ylim=c(40,130),col="black",pch = 21, bg = "white")
		abline(fit_MBP,col="black")
		
		
		 		
		
		###7)HR
		data_6 <- data_new2[,c(3,9)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","HR")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_HR <- lm(HR~Temperature, data=data_6)
		summary(fit_HR)
		plot(data_6$Temperature,data_6$HR,xlab="Temperature",ylab="HR",
		     ylim=c(25,120),col="black",pch = 21, bg = "white")
		abline(fit_HR,col="black")
		
		
		###8)CO
		data_6 <- data_new2[,c(3,11)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","CO")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_CO <- lm(CO~Temperature, data=data_6)
		summary(fit_CO)
		plot(data_6$Temperature,data_6$CO,xlab="Temperature",ylab="CO",
		     ylim=c(1,40),col="black",pch = 21, bg = "white")
		abline(fit_CO,col="black")
		
		
		
		###9)SVV
		data_6 <- data_new2[,c(3,12)]  ###提取第2和4列
		#data_4 <- data_new2[,c("Temperature","SVV")] ##同上，只是具体指名那一列
		data_6 <- na.omit(data_6)
		
		fit_SVV <- lm(SVV~Temperature, data=data_6)
		summary(fit_SVV)
		plot(data_6$Temperature,data_6$SVV,xlab="Temperature",ylab="SVV",
		     ylim=c(1,30),col="black",pch = 21, bg = "white")
		abline(fit_SVV,col="black")
		
		
		
		
	
