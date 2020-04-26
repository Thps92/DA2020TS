library(readtext)
library(stringr)

for (j in 19073:19138) {
  PP <- readtext(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten_txt/", paste0( j, "/", j, "raw.txt")), cache = FALSE)
  write.csv(str_split_fixed(PP, "Schäuble:|Oppermann:|Friedrich:|Kubicki:|Schauble:|Roth:", n = str_count(PP, "Schäuble:|Oppermann:|Friedrich|Kubicki:|Schauble:|Roth:")), file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten_txt/", paste0( j, "/", j, "raw.csv")))

  data = read.csv(file.path("/Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/Plenarprotokolle_Rohdaten_txt/", paste0( j, "/", j, "raw.csv")))

  for (i in 1:ncol(data)) {
    a <- data.frame(data[,i])
    myfile <- file.path("//Users/tobi/Desktop/DA_Repository_GIT/DA2020TS/PP2019Reden/", paste0( j, "-", i, ".txt"))
    write.table(a, file = myfile, sep = "", row.names = FALSE, col.names = FALSE, quote = FALSE, append = FALSE)
  }

}






