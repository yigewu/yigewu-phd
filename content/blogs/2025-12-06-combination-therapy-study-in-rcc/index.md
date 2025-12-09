---
title: Optimizing Combination Therapies in Drug-Resistant RCC
author: Yige Wu
date: '2025-12-06'
slug: []
categories: []
tags: []
image: ~
description: ~
toc: ~
---
**Summary:**
A translational study utilizing Patient-Derived Xenograft (PDX) models to evaluate the efficacy of combining Cabozantinib (VEGFR/MET/AXL inhibitor) with Sapanisertib (mTORC1/2 inhibitor).

**My Role:** Computational Biologist & Statistical Analyst

**Tech Stack:** Differential Expression Analysis, Survival Analysis, Pathway Enrichment (GSEA), Correlation Analysis.

### The Challenge
While targeted therapies like Cabozantinib are standard care for metastatic RCC, resistance eventually develops. Patients who fail first-line therapies have limited options. We hypothesized that targeting both the VEGF/MET axis and the mTOR pathway simultaneously could overcome intrinsic resistance.

### The Solution
* **Harmonization:** Standardized tumor volume data across 6 distinct PDX models to compare treatment responses (Vehicle vs. Monotherapy vs. Combo).
* **Omics Profiling:** Analyzed bulk RNA-seq and protein arrays from treated tumors to identify the molecular drivers of response.
* **Pathway Analysis:** Interrogated downstream signaling changes, specifically focusing on the ERK and AKT/mTOR pathways.

### Key Findings
* **Superior Efficacy:** The combination therapy outperformed monotherapies in all 6 models, achieving significant tumor regression in models resistant to single agents.
* **Mechanism of Action:** Found that adding Sapanisertib to Cabozantinib effectively suppresses **pERK levels**, preventing the pathway reactivation often seen in drug resistance.
* **Biomarker Identification:** Identified that **baseline MET protein levels** negatively correlate with Cabozantinib response, establishing low MET as a potential predictive biomarker for treatment sensitivity.

[📄 Read the Full Publication in Cancer Research](https://doi.org/10.1158/0008-5472.CAN-23-0604)

