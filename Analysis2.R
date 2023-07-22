#Plotting

df = read.csv("Symptom_severity.csv",header=T)
View(df)
#read.csv("data2.csv", header=T, na.strings=c("",NA))
#View(df)


df1 = df[0:50,]
df2 = df[50:100,]
df3 = df[100:133,]


pie(df1$weight,df1$Symptom )
pie(df2$weight,df2$Symptom )
pie(df3$weight,df3$Symptom )

barplot(df1$weight, names.arg=df1$Symptom, xlab = "Symptom", ylab = "Severity")
barplot(df2$weight, names.arg=df2$Symptom, xlab = "Symptom", ylab = "Severity")
barplot(df3$weight, names.arg=df3$Symptom, xlab = "Symptom", ylab = "Severity")

df$Symptom

