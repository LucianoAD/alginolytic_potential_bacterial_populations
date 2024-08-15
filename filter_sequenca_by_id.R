# Install and load the package
install.packages("seqinr", dependencies = TRUE)
library(seqinr)

# Set the working directory
setwd("your path")

# Read the FASTA file
file_path <- "file_name.fasta"
sequences_list <- read.fasta(file = file_path, as.string = TRUE, seqtype = "AA", set.attributes = FALSE)

# Define the sequence IDs of interest
seq_ids <- c("seq_id1", "seq_id2", "...")

# Find sequences by ID and extract them
get_sequences <- function(ids, sequences_list) {
  indices <- sapply(ids, function(id) grep(id, names(sequences_list)))
  sequences_list[unlist(indices)]
}

# Get the sequences
vec <- get_sequences(seq_ids, sequences_list)

# Remove duplicates
vec2 <- unique(vec)

# Save the sequences to a FASTA file
write.fasta(sequences = vec2, names = names(vec2), file.out = "filtered_file.fasta", open = "w")

