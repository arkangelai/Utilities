library(digest)
library(readxl)
library(writexl)

Datos_Excel <- read_excel("/Users/julialex/Desktop/testMedisinu.xlsx")

vector_cedulas <- paste(Datos_Excel$NUMERO_DOCUMENTO)
vector_hash <- character(length(vector_cedulas))

for (i in 1:length(vector_cedulas)){
  vector_hash[i] <- toupper(digest(vector_cedulas[i], "sha2", serialize = FALSE))
}

Datos_Excel$Hash <- vector_hash
write_xlsx(Datos_Excel, "/Users/julialex/Desktop/testMedisinu_results.xlsx")
