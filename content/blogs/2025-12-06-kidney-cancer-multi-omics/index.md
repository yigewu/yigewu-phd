---
title: Kidney Cancer Multi-Omics
author: Package Build
date: '2025-12-06'
slug: []
categories: []
tags: []
image: ~
description: ~
toc: ~
---
Based on the presentation materials you uploaded, you have two very strong, scientifically rigorous case studies ready to go. These demonstrate **Multi-Omics Discovery** (Project 1) and **Translational Mechanism of Action** (Project 2).

Here is the drafted content for your portfolio "Projects" section, formatted to be copy-pasted directly into your Markdown/Hugo files. I have focused on the "Problem → Solution → Result" structure that hiring managers love.

---
## Deciphering Tumor Heterogeneity via Single-Nucleus Multi-Omics

**Summary:**
A comprehensive investigation into the cellular architecture of clear cell Renal Cell Carcinoma (ccRCC) using integrated single-nucleus RNA-seq (snRNA-seq), snATAC-seq, and bulk proteomics. This study aimed to overcome the limitations of bulk sequencing to identify granular tumor-specific markers and regulatory mechanisms.

**My Role:** Lead Bioinformatics Scientist & Project Lead
**Tech Stack:** R (Seurat, Harmony), Python, Unix, High-Performance Computing (HPC).

### The Challenge
Standard bulk sequencing obscures the signals of distinct cell populations within the tumor microenvironment. We needed to map the complex ecosystem of 13+ epithelial cell types, immune cells, and stromal support cells to understand why certain tumors resist treatment and identify novel therapeutic targets.

### The Solution
I designed and executed a multi-omics integration strategy involving over 30 primary tumor cases.
* **Pipeline Development:** Engineered reproducible bioinformatics pipelines to process raw FASTQ data, performing QC, dimensionality reduction (UMAP), and batch correction (Harmony).
* **Integration:** Developed a framework to map transcriptomic data (snRNA-seq) with chromatin accessibility data (snATAC-seq) and proteomic layers.
* **Target Identification:** Screened for surface-localized proteins that showed differential expression in tumor vs. normal cells and differential chromatin accessibility.

### Key Findings
* **Novel Biomarker Discovery:** Identified **Ceruloplasmin (CP)** as a robust tumor-specific marker. Validated that high CP expression correlates with poor patient prognosis in large external cohorts (CPTAC).
* **Regulatory Mechanism:** Discovered that the transcription factor **KLF9** regulates CP expression via specific binding motifs in open promoter regions accessible only in tumor cells.
* **Microenvironment Impact:** Spatial analysis revealed CP enrichment in hyalinized stroma, suggesting a mechanism for tumor-stroma interaction and a potential route for disrupting the tumor niche.

