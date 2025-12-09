---
title: ConnectMore (Obsidian Plugin)
author: Yige Wu
date: '2025-12-09'
slug: []
categories: []
tags: []
image: ~
description: ~
toc: ~
---
**Summary:**
A custom Personal Relationship Management (PRM) tool built for the Obsidian knowledge base. This plugin automates the ingestion of contact data to streamline professional networking and job search tracking.

**Role:** Solo Developer

**Tech Stack:** TypeScript, JavaScript, NodeJS, Obsidian API, GitHub Copilot.
**Repository:** https://github.com/yglow/obsidian-connectmore

#### The Challenge
During my active job search, I needed a way to centralize hundreds of professional contacts from phone logs, email, and LinkedIn into a secure, local-first database (Obsidian). Manually creating files for each contact was inefficient and prone to data entry errors.

#### The Solution
I engineered a custom plugin using **TypeScript** to bridge the gap between standard contact files and markdown notes.
* **VCF Parsing Engine:** Developed a module to parse standard vCard (`.vcf`) files, extracting key metadata (Name, Organization, Email) and mapping them to frontmatter properties.
* **Template Automation:** implemented a templating system that automatically generates structured person-notes, ensuring consistent data formatting for future queries.
* **Batch Processing:** Designed the architecture for batch-editing metadata across multiple files to handle large-scale updates (e.g., updating statuses for multiple contacts at once).

#### Key Learning
This project served as a deep dive into the **Obsidian API** and modern **TypeScript** workflows. I leveraged **GitHub Copilot** (Agent Mode) to accelerate boilerplate generation and unit testing, treating the development process as a sandbox for AI-assisted coding practices.