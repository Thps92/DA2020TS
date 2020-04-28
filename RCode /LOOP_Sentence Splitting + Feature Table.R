library("readtext")
library("stringr")
require("tibble")



for (i in 19073:19138) {
  
  wd = file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0(i))
  
  x <-  length(list.files(path = wd)) 
  
  for (j in 3:(x-2)) {
    
    PP <- readtext(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( i, "/", i ,"-" , j, ".txt")), cache = FALSE)
    
    
    write.csv(t(str_split_fixed(PP, "\n", n = str_count(PP, "\n"))), file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/" ,paste0( i, "/", i, "-", j, ".csv")))
    
    PP2 <- read.csv(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/" ,paste0( i, "/", i, "-", j ,".csv")))
    
    PP2 <- add_column(PP2, Argumentativ = "")
    PP2 <- add_column(PP2, Claim_Premise = "")
    if (nrow(PP2) > 0) {PP2 <- add_column(PP2, Satz_Nr = sprintf("%02d", 0:(nrow(PP2)-1)))}
    PP2 <- add_column(PP2, Rede_Nr = (j))
    PP2 <- add_column(PP2, Sitzungsnummer = i)
    
    write.csv(PP2, file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/" ,paste0( i, "/", i, "-", j ,"final.csv")))
    write.csv(PP2, file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/PP2019+Merkmale/" ,paste0( i, "-", j ,"final.csv")))
  }
}

