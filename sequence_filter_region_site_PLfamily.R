# Load the necessary library
library(XLConnect)

# Load the Excel file and specific sheet 
wb <- loadWorkbook("Please refer to the sequences file", create = TRUE)
tabla <- readWorksheet(wb, sheet = "Tabla_R", header = TRUE)

# View the loaded table
print(tabla)
print(dim(tabla))  # Dimensions of the table
print(names(tabla))  # Column names

# Filter sequences belonging to the "SWE" region
SWE <- grep("SWE", tabla$Query)
SWE_TABLA <- tabla[SWE,]

# Check the content and dimensions of the filtered table
print(SWE_TABLA)
print(dim(SWE_TABLA))
print(names(SWE_TABLA))

# Filter sequences from the "KBA" site
KBA_pos <- grep("KBA", SWE_TABLA$Query)
KBA_tabla <- SWE_TABLA[KBA_pos,]

# Filter sequences from the "KBB" site
KBB_pos <- grep("KBB", SWE_TABLA$Query)
KBB_tabla <- SWE_TABLA[KBB_pos,]

# Filter specific samples in KBA
SWE02_pos <- grep("SWE02", KBA_tabla$Query)
SWE_2_tabla <- KBA_tabla[SWE02_pos,]

SWE07_pos <- grep("SWE07", KBA_tabla$Query)
SWE_7_tabla <- KBA_tabla[SWE07_pos,]

SWE12_pos <- grep("SWE12", KBA_tabla$Query)
SWE_12_tabla <- KBA_tabla[SWE12_pos,]

SWE21_pos <- grep("SWE21", KBA_tabla$Query)
SWE_21_tabla <- KBA_tabla[SWE21_pos,]

# Filter specific samples in KBB
SWE26_pos <- grep("SWE26", KBB_tabla$Query)
SWE_26_tabla <- KBB_tabla[SWE26_pos,]

SWE18_pos <- grep("SWE18", KBB_tabla$Query)
SWE_18_tabla <- KBB_tabla[SWE18_pos,]

# Filter and save sequences by families and subfamilies
filter_and_save <- function(table, family, path) {
  pos <- grep(family, table$Subject)
  family_table <- table[pos,]
  write.table(family_table, file = path, col.names = TRUE, row.names = FALSE, sep = ",")
}

# Apply function for different families/subfamilies and save results in CSV files
filter_and_save(SWE_26_tabla, "PL01", "SWE/PL01_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL2", "SWE/PL2_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL3", "SWE/PL3_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL4", "SWE/PL4_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL5", "SWE/PL5_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL6", "SWE/PL6_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL6_SF1", "SWE/PL6_SF1_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL6_SF2", "SWE/PL6_SF2_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL6_SF3", "SWE/PL6_SF3_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL07", "SWE/PL07_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL7_SF1", "SWE/PL7_SF1_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL7_SF3", "SWE/PL7_SF3_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL7_SF4", "SWE/PL7_SF4_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL7_SF5", "SWE/PL7_SF5_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL7_SFNC", "SWE/PL7_SFNC_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL8", "SWE/PL8_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL9", "SWE/PL9_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL10", "SWE/PL10_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL11", "SWE/PL11_26_TABLE.csv")
filter_and_save(SWE_26_tabla, "PL12", "SWE/PL12_26_TABLE.csv")
