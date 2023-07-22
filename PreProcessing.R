# Reading the Dataframe
df = read.csv("dataset.csv",header=T,na.strings=c("",NA))
dim(df)
View(df)
#Shape of Dataframe
dim(df)


#MissRate
(colMeans(is.na(df)))*100

#Removing the last 4 columns
df = subset(df, select = -c(Symptom_13,Symptom_14,Symptom_15,Symptom_16,Symptom_17) )



library(dplyr)
#Imputation

allDiseases = unique(df$Disease)

getmode <- function(v){
  v=v[nchar(as.character(v))>0]
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

for (dis in allDiseases){
  tDf = df%>%filter(Disease==dis)
  for (cols in colnames(tDf[,2:13])) {
    tDf<-tDf%>%mutate(!!cols := replace(!!rlang::sym(cols), is.na(!!rlang::sym(cols)), getmode(!!rlang::sym(cols))))
  }
  df[df$Disease == dis,] = tDf
}

newDf2 <- data.frame(df)

View(newDf2)


(colMeans(is.na(df)))*100


#Label Encoding
encodedDf<-data.frame(df)

encodedDf$Disease = as.numeric(factor(encodedDf$Disease))
encodedDf$Symptom_1 = as.numeric(factor(encodedDf$Symptom_1))
encodedDf$Symptom_2 = as.numeric(factor(encodedDf$Symptom_2))
encodedDf$Symptom_3 = as.numeric(factor(encodedDf$Symptom_3))
encodedDf$Symptom_4 = as.numeric(factor(encodedDf$Symptom_4))
encodedDf$Symptom_5 = as.numeric(factor(encodedDf$Symptom_5))
encodedDf$Symptom_6 = as.numeric(factor(encodedDf$Symptom_6))
encodedDf$Symptom_7 = as.numeric(factor(encodedDf$Symptom_7))
encodedDf$Symptom_8 = as.numeric(factor(encodedDf$Symptom_8))
encodedDf$Symptom_9 = as.numeric(factor(encodedDf$Symptom_9))
encodedDf$Symptom_10 = as.numeric(factor(encodedDf$Symptom_10))
encodedDf$Symptom_11 = as.numeric(factor(encodedDf$Symptom_11))
encodedDf$Symptom_12 = as.numeric(factor(encodedDf$Symptom_12))



# Making all NA values zero.
encodedDf[is.na(encodedDf)] = 0


View(encodedDf)

