# Load necessary libraries
library(ggplot2)
library(dplyr)
library(tidyr)
library(patchwork) # If you don't have this, run: install.packages("patchwork")

set.seed(42)

# 1. Simulate the Data (20,000 genes)
# TCGA Reference: Standard log-normal distribution
tcga_tpm <- rlnorm(20000, meanlog = 2, sdlog = 1.5)

# N=1 Patient: Different sequencing depth/platform = shifted distribution
n1_tpm <- rlnorm(20000, meanlog = 0.5, sdlog = 1.2) 

# Insert our Target Gene (e.g., CP)
# Biologically, it is highly overexpressed in the N=1 patient.
# But technically, the raw TPM looks LOWER than the TCGA average due to the batch effect.
target_gene_tcga <- quantile(tcga_tpm, 0.85) # 85th percentile in TCGA (Value ~ 35)
target_gene_n1 <- quantile(n1_tpm, 0.99)   # 99th percentile in N=1 (Value ~ 26)

# 2. Create Absolute TPM Plot (The "Trap")
df_tpm <- data.frame(
  Expression = c(tcga_tpm, n1_tpm),
  Cohort = factor(rep(c("TCGA Reference", "N=1 Patient"), each = 20000))
)

p1 <- ggplot(df_tpm, aes(x = log2(Expression + 1), fill = Cohort, color = Cohort)) +
  geom_density(alpha = 0.4) +
  geom_vline(xintercept = log2(target_gene_n1 + 1), color = "#E69F00", linetype = "dashed", size = 1) +
  annotate("text", x = log2(target_gene_n1 + 1) + 0.5, y = 0.15, label = "Target Gene (N=1)", color = "#E69F00", angle = 90) +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
  scale_color_manual(values = c("#E69F00", "#56B4E9")) +
  theme_minimal() +
  labs(title = "A: Absolute Expression (Batch Effect)",
       x = "Log2(TPM + 1)", y = "Density") +
  theme(legend.position = "bottom")

# 3. Transform to Intra-Sample Percentiles (The Solution)
tcga_percentile <- ecdf(tcga_tpm)(tcga_tpm) * 100
n1_percentile <- ecdf(n1_tpm)(n1_tpm) * 100

df_percentile <- data.frame(
  Percentile = c(tcga_percentile, n1_percentile),
  Cohort = factor(rep(c("TCGA Reference", "N=1 Patient"), each = 20000))
)

p2 <- ggplot(df_percentile, aes(x = Percentile, fill = Cohort, color = Cohort)) +
  geom_density(alpha = 0.4, adjust = 2) + # adjust=2 smooths the uniform distribution visually
  geom_vline(xintercept = 99, color = "#E69F00", linetype = "dashed", size = 1) +
  annotate("text", x = 95, y = 0.005, label = "99th Percentile", color = "#E69F00", angle = 90) +
  scale_fill_manual(values = c("#E69F00", "#56B4E9")) +
  scale_color_manual(values = c("#E69F00", "#56B4E9")) +
  theme_minimal() +
  labs(title = "B: Rank-Based Transformation",
       x = "Intra-Sample Percentile", y = "Density") +
  theme(legend.position = "bottom")

# 4. Combine and Save
final_plot <- p1 + p2
ggsave("rank_normalization_plot.png", plot = final_plot, width = 10, height = 5, dpi = 300)