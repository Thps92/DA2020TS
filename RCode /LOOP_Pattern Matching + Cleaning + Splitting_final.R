library(readtext)
library(stringr)

for (j in 19101:19138) {
  PP1 <- readtext(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( j, "/", j, "raw.txt")), cache = FALSE);
  PP2 = str_replace_all(PP1, c( "\\.\\.\\.\\.\\.\\.\\." = " ", "\\.\\.\\.\\.\\." = " ", "\\.\\.\\.\\." = " ", "\\.\\.\\." = " ", "\\.\\." = " ", "ii" = "ü", "\r" = " ", "\t" = " ", "\v" = " ", "-\n" = "", "\n" = " ", "\f" = " ", "\\(.+?\\)" = " ", "  " = "", "   " = "", "    " = "", "\\." = "\\.\n", ":" = ":\n"));
  write.table(PP2, file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( j, "/", j, "rawClean.txt")))
 
    
  PP2 <- readtext(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( j, "/", j, "rawClean.txt")), cache = FALSE)
  
    write.csv(str_split_fixed(PP2, "Schäuble:|Oppermann:|Friedrich:|Kubicki:|Schauble:|Roth:", n = str_count(PP2, "Schäuble:|Oppermann:|Friedrich|Kubicki:|Schauble:|Roth:")), file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( j, "/", j, "rawClean.csv")))

  data = read.csv(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( j, "/", j, "rawClean.csv")))

  for (i in 3:ncol(data)) {
    a <- data.frame(data[,i])
    myfile <- file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/RawCleanSpeeches/", paste0( j, "-", i, ".txt"))
    write.table(a, file = myfile, sep = "", row.names = FALSE, col.names = FALSE, quote = FALSE, append = FALSE)
    myfile2 <- file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten/", paste0( j, "/", j, "-", i, ".txt"))
    write.table(a, file = myfile2, sep = "", row.names = FALSE, col.names = FALSE, quote = FALSE, append = FALSE)
  }

}






