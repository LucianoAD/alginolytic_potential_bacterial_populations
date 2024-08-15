# XLConnect Package
# ANTARCTICA AND NORWAY:

library(XLConnect)
wb <- loadWorkbook("seqs.xls", create = TRUE)
table2 <- readWorksheet(wb, sheet = "NOR+ANT", header = TRUE)

# Filter sequences with length greater than 100 aa
table2 <- table2[table2$Length > 100,]

# Function to filter sequences by length range and pattern
filter_sequences <- function(table, pattern, min_length, max_length) {
  group <- table[table$Length >= min_length & table$Length <= max_length, ]
  filtered_indices <- grep(pattern, group$Sequences)
  filtered_table <- group[filtered_indices, ]
  return(length(filtered_indices))
}

# Function to generate the final vector for a given sample
generate_sample_vector <- function(sample_name) {
  vector <- c(
    filter_sequences(table2, sample_name, 100, 250),
    filter_sequences(table2, sample_name, 251, 500),
    filter_sequences(table2, sample_name, 501, 750),
    filter_sequences(table2, sample_name, 751, 1000)
  )
  return(vector)
}

# Antarctica Samples
ANT01 <- generate_sample_vector("ANT01")
ANT02 <- generate_sample_vector("ANT02")
ANT03 <- generate_sample_vector("ANT03")
ANT04 <- generate_sample_vector("ANT04")
ANT05 <- generate_sample_vector("ANT05")
ANT06 <- generate_sample_vector("ANT06")

# Final DataFrame for Antarctica
final_table_ANT <- data.frame(
  "sample" = c("ANT01", "ANT02", "ANT03", "ANT04", "ANT05", "ANT06"),
  "from 100 to 250" = c(ANT01[1], ANT02[1], ANT03[1], ANT04[1], ANT05[1], ANT06[1]),
  "from 251 to 500" = c(ANT01[2], ANT02[2], ANT03[2], ANT04[2], ANT05[2], ANT06[2]),
  "from 501 to 750" = c(ANT01[3], ANT02[3], ANT03[3], ANT04[3], ANT05[3], ANT06[3]),
  "from 751 to 1000" = c(ANT01[4], ANT02[4], ANT03[4], ANT04[4], ANT05[4], ANT06[4])
)
print(final_table_ANT)

# Norway Samples
NOR02 <- generate_sample_vector("NOR02")
NOR03 <- generate_sample_vector("NOR03")
NOR04 <- generate_sample_vector("NOR04")
NOR05 <- generate_sample_vector("NOR05")
NOR06 <- generate_sample_vector("NOR06")

# Final DataFrame for Norway
final_table_NOR <- data.frame(
  "sample" = c("NOR02", "NOR03", "NOR04", "NOR05", "NOR06"),
  "from 100 to 250" = c(NOR02[1], NOR03[1], NOR04[1], NOR05[1], NOR06[1]),
  "from 251 to 500" = c(NOR02[2], NOR03[2], NOR04[2], NOR05[2], NOR06[2]),
  "from 501 to 750" = c(NOR02[3], NOR03[3], NOR04[3], NOR05[3], NOR06[3]),
  "from 751 to 1000" = c(NOR02[4], NOR03[4], NOR04[4], NOR05[4], NOR06[4])
)
print(final_table_NOR)
