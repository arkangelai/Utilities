library(digest)
library(readxl)
library(writexl)

Datos_Excel <- read_excel("/Users/julialex/Desktop/testMedisinu.xlsx")

vector_cedulas <- paste(Datos_Excel$Cedulas)

for (i in 1:length(vector_cedulas)){
  Datos_Excel$Hash[i] <- toupper(digest(vector_cedulas[i], "sha2", serialize = FALSE))
}

write_xlsx(Datos_Excel, "/Users/julialex/Desktop/testMedisinu_results.xlsx")
