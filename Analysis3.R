library(dplyr)
df = read.csv("symptom_precaution.csv",header=T)
dis = readline();
allPrects = df%>% filter(Disease == dis) %>% select(Precaution_1,Precaution_2,Precaution_3,Precaution_4)


for (x in allPrects){
  print(x)
}
