# DepMap Candidate Gene Analysis
# APLP2, DZIP3, DDX42

# Packages
library(data.table)
library(ggplot2)

# Load DepMap data
file <- "PATH_TO_CRISPRGeneEffect.csv"

# Extract candidate genes
header <- names(fread(file, nrows = 0))

gene_cols <- grep(
  "APLP2|DZIP3|DDX42",
  header,
  value = TRUE
)

genes <- fread(
  file,
  select = c("V1", gene_cols)
)

# Rename columns
setnames(
  genes,
  c("V1", gene_cols),
  c("ModelID", "APLP2", "DDX42", "DZIP3")
)

# Summary statistics
overall_stats <- data.table(
  Gene = c("APLP2", "DZIP3", "DDX42"),
  Mean = c(
    mean(genes$APLP2, na.rm = TRUE),
    mean(genes$DZIP3, na.rm = TRUE),
    mean(genes$DDX42, na.rm = TRUE)
  ),
  Median = c(
    median(genes$APLP2, na.rm = TRUE),
    median(genes$DZIP3, na.rm = TRUE),
    median(genes$DDX42, na.rm = TRUE)
  ),
  SD = c(
    sd(genes$APLP2, na.rm = TRUE),
    sd(genes$DZIP3, na.rm = TRUE),
    sd(genes$DDX42, na.rm = TRUE)
  )
)

print(overall_stats)