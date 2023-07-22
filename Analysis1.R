
df = read.csv("dataset.csv",header=T,na.strings=c("",NA))

#Unique Symptoms

uniqueSymptoms = c()

for (cols in colnames(df[,2:18])) {
  
  uniqueSymptoms = c(uniqueSymptoms , unique(select(df,cols)))
  
}
uniqueSymptoms = unlist(uniqueSymptoms)
uniqueSymptoms = unique(uniqueSymptoms)
uniqueSymptoms


#Unique Disease
unique(df$Disease)


#Most Occuring Symptom
allSympts = as.vector(as.matrix(df[,c("Symptom_1" , "Symptom_2" , "Symptom_3",  "Symptom_4" , "Symptom_5",  "Symptom_6", "Symptom_7" , "Symptom_8",  "Symptom_9",  "Symptom_10", "Symptom_11", "Symptom_12", "Symptom_13", "Symptom_14", "Symptom_15", "Symptom_16" ,"Symptom_17")]))
fact_1 = factor(allSympts)
newdf$fact_1
newdf = data.frame(fact_1)
names(which.max(table(newdf$fact_1)))
#Least ....
names(which.min(table(newdf$fact_1)))
table(newdf$fact_1)


#Barplot of Symptom frequency
allSympts = as.vector(as.matrix(df[,c("Symptom_1" , "Symptom_2" , "Symptom_3",  "Symptom_4" , "Symptom_5",  "Symptom_6", "Symptom_7" , "Symptom_8",  "Symptom_9",  "Symptom_10", "Symptom_11", "Symptom_12")]))
countSympts = data.frame(table(allSympts))
countSympts = countSympts[ -c(1), ]
barplot(countSympts$Freq, names.arg=countSympts$allSympts)



#Symptom percentage per Disease

filterDf = dplyr::filter(df, df$Disease == "GERD")
filterDf
allSympts = as.vector(as.matrix(filterDf[,c("Symptom_1" , "Symptom_2" , "Symptom_3",  "Symptom_4" , "Symptom_5",  "Symptom_6", "Symptom_7" , "Symptom_8",  "Symptom_9",  "Symptom_10", "Symptom_11", "Symptom_12", "Symptom_13", "Symptom_14", "Symptom_15", "Symptom_16" ,"Symptom_17")]))
allSympts<-allSympts[!is.na(allSympts)]
prop.table(table(allSympts))









