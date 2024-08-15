

# Load data
kw <- read.csv(file="data.csv", header=TRUE)

# Perform Kruskal-Wallis test
kruskal_test_result <- kruskal.test(normalized_count ~ site, data=kw)


# Check if there are significant differences
if (kruskal_test_result$p.value < 0.05) {
  cat("Conclusion: There are significant differences between the sites (p-value =", 
      round(kruskal_test_result$p.value, 4), ").\n")
} else {
  cat("Conclusion: There are no significant differences between the sites (p-value =", 
      round(kruskal_test_result$p.value, 4), ").\n")
}

# If there are significant differences, perform post-hoc pairwise comparisons
if (kruskal_test_result$p.value < 0.05) {
  require(PMCMR)
  
  # Post-hoc test using Tukey and Kramer (Nemenyi) test
  posthoc_result <- posthoc.kruskal.nemenyi.test(x = kw$normalizado, g = kw$site, method = "Tukey", p.adjust.method = "bonf")
  
  
  cat("Conclusion: The following site comparisons show significant differences (p-value < 0.05):\n")
  
  # Extract and display significant comparisons
  significant_comparisons <- which(posthoc_result$p.value < 0.05, arr.ind = TRUE)
  for (i in 1:nrow(significant_comparisons)) {
    row <- significant_comparisons[i, "row"]
    col <- significant_comparisons[i, "col"]
    site1 <- rownames(posthoc_result$p.value)[row]
    site2 <- colnames(posthoc_result$p.value)[col]
    p_value <- posthoc_result$p.value[row, col]
    
    cat(site1, "is significantly different from", site2, "(p-value =", round(p_value, 4), ").\n")
  }
} else {
  cat("No further post-hoc tests are needed as there are no significant differences between the sites.\n")
}
