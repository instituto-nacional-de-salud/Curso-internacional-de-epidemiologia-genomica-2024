######################################################
############### UNION METADATA #######################
######################################################

setwd("D:/R/Practica R")

install.packages("readxl")
library(readxl)

if(!require("readxl")) {
  install.packages("readxl")
  library(readxl)
}

#Cargar metadata demográfica
df1 <- read_excel("D:/R/Practica R/demograficos.xlsx")
df1

#cargar metadata CARD
df2 <- read.csv("D:/R/Practica R/CARD.csv", sep=";")

df2

#funcion que verifica si el paquere eta instalado
if (!require("data.table")) {
  install.packages("data.table")
  library(data.table)
  
}

#convertir en data frames y hacer merge

dt1 <- as.data.table(df1)
dt2 <- as.data.table(df2)

result <- merge(dt1, dt2, by = "id", all.x = TRUE) #all.x true es equivalente a left merge

#renombrar columna
if (!require("dplyr")) {
  install.packages("dplyr")
  library("dplyr")
  
}
if (!require("writexl")) {
  install.packages("writexl")
  library("writexl")
  
}

write_xlsx(result, path = "Metadata_25_9_2024.xlsx")
result
