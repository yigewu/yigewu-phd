---
title: "Forensics on the Filesystem: Identifying Unannotated FASTQ Data"
date: '2026-02-17'
slug: unannotated-fastq-forensics
categories:
  - Bioinformatics
  - Data Engineering
tags:
  - RNA-seq
  - DNA-seq
  - QC
---

### The Challenge

In a recent technical discussion, I tackled a practical data hygiene problem: You are handed a raw, unannotated FASTQ file with no metadata. Is it RNA-seq (transcriptomic) or DNA-seq (genomic)?

Running a full alignment on a multi-gigabyte file just to check the data type is computationally wasteful. We need a heuristic to determine the identity quickly.

### The Biological Insight

The key difference lies in the physical origins of the fragments.

* **DNA-seq (WGS):** Fragments come from the entire genome, covering both coding (exons) and non-coding (introns) regions roughly equally.
* **RNA-seq:** Fragments are derived from mature mRNA. This creates a distinct biological signature: high exonic coverage, near-zero intronic coverage, and—crucially—reads that span across splice junctions.

![Figure: Unspliced and spliced alignment. Figure from Van den Berge et al. (2019).](/images/projects/splicedAlignment.png)

### The Proposed Algorithm

To solve this without burning compute resources, I devised a "Sample & Check" pipeline:

1.  **Subsample:** Extract the first 10,000 reads (sufficient for a statistical signal).
2.  **Quick Map:** Align this subset to a reference genome.
3.  **The Decision Matrix:** Check two specific metrics to classify the file.

| Metric | Whole Genome DNA | Exome Capture (DNA) | RNA-seq |
| :--- | :--- | :--- | :--- |
| **Exon/Intron Ratio** | `\(\approx\)` 1:1 (Balanced) | High (Mostly Exons) | High (Mostly Exons) |
| **Splice Junctions** | Absent | Absent | **Present** |

### Conclusion

The presence of "gapped alignments" (reads split across introns) is the definitive "smoking gun" that distinguishes RNA-seq from Exome capture DNA. This heuristic allows for rapid classification of legacy data lakes without manual curation.
