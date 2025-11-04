# 🧰 Simple, Useful R Tips — Live Demo

**Author:** Qian Ye  
**Date:** November 3, 2025  
**Format:** Quarto Reveal.js slides  

---

## 🎯 Purpose

This repository contains materials for the **live demonstration** titled  
**"Simple, Useful R Tips — Live Demo"**, designed for collaborative research teams involving epidemiologists and statisticians.

The goal of this demo is to showcase a **minimal, reproducible R workflow** that demonstrates:
- A tidy project organization  
- Key R packages for everyday analysis  
- Generating publication-quality descriptive and model tables  
- Using Quarto Reveal.js for interactive presentation  

---

## 🪶 Presentation Overview

**Slides:** [`reports/live demo.qmd`](reports/live demo.qmd)  
Rendered as an interactive Quarto Reveal.js presentation.

**Topics covered:**
- Minimal, reproducible R workflow:  
  `import → clean → describe → model → report`
- Organizing a project with an RStudio Project
- Using essential R packages:  
  `here`, `tidyverse`, `table1`, and `gtsummary`
- Producing publication-ready descriptive and model tables
- Demonstrating good practices for file structure and reproducibility
- Organizing results, figures, and reports efficiently

---

## 📁 Project Structure
```text
R-tips-for-EMBARC/
├── analysis/               # Scripts for each analysis step
│   ├── 00_dependencies.R   # Load and install packages
│   ├── 01_data_process.R   # Import and clean raw data
│   ├── 02_describe.R       # Produce descriptive tables
│   └── 03_model.R          # Produce models

│
├── data/
│   ├── raw/                # Raw data (read-only)
│   └── clean/              # Cleaned data files (.csv, .rds)
│
├── results/
│   ├── temp/               # Intermediate outputs (temporary)
│   └── Results.xlsx        # Final tables for reports or manuscripts
│
├── figures/                # Figures and exported tables (e.g., table.png)
│
├── reports/                # Quarto reports and slides
│   └── live-demo.qmd
│
├── references/             # Reading materials and documentation
│
├── README.md               # Project documentation (this file)
│
└── R-tips-for-EMBARC.Rproj # RStudio project file (open this to start)
```
## 🪄 How to Reproduce the Demo

### **Step 0 — Clone the repository**

Open a terminal or RStudio console and run:

```{bash}
git clone https://github.com/<your-username>/R-tips-for-EMBARC.git
cd R-tips-for-EMBARC
```
or

Download the entire repo as a .Zip file in your local path.

This will create a local copy of the project folder.

---

### **Step 1 — Open the RStudio Project**

Open the file `R-tips-for-EMBARC.Rproj` in RStudio.  
This ensures all relative paths work correctly with the `{here}` package.

---

### **Step 2 — Run all the R scripts under `Analysis/` step by step**

Run the script

- `analysis/00_dependencies.R`

  - Defines the complete list of R packages used in the demo  
  - Installs any missing packages automatically  
  - Loads all packages into the current R session 

- `analysis/01_data_process.R`


  1. Loads the dependencies  
  2. Imports the raw dataset from `data/raw/`  
  3. Cleans variable names using `janitor::clean_names()`  
  4. Derives new variables such as `age_grp` and `index_yr`  
  5. Saves the cleaned dataset to:
    - `data/clean/study_clean.csv`  
    - `data/clean/study_clean.rds`


- `analysis/02_describe.R`
  1. Imports the cleaned dataset 
  2. Assigns labels and units to variables  
  3. Defines a custom renderer for medians and IQRs  
  4. Produces:
   - **Table 1** using the `{table1}` package  
   - **Summary Table** using the `{gtsummary}` package  
  5. Saves outputs to:
   - `results/temp/summary_table1.csv`  
   - `figures/table.png`

- `analysis/03_model.R`
  1. Imports the cleaned dataset 
  2. fit a logsitic regression  
  4. Produces **Model Table** using the `{gtsummary}` package  
  5. Saves outputs to:
   - `figures/model.png`

```{r}
source("analysis/00_dependencies.R")
source("analysis/01_data_process.R")
source("analysis/02_describe.R")
source("analysis/02_model.R")
```


### **Step 3 — Render the Quarto presentation**

Use **Quarto** to render the interactive Reveal.js slides:

```{bash}
quarto render reports/live demo.qmd
```

This will generate an HTML presentation (`live demo.html`) inside the `reports/` folder.  
Open it in your browser to view the slides.

---

### **Step 6 — View the outputs**

- **Figures** → located in `figures/model.png` and `figures/table.png` 
- **Results** → intermediate CSV or RDS files in `results/temp/`  
- **Slides** → rendered HTML presentation in `reports/live demo.html`  

---

### ✅ **Summary of the workflow**

1. Clone the repository  
2. Open the RStudio Project  
3. Run `00_dependencies.R` to install and load packages  
4. Run `01_data_process.R` to clean and save data  
5. Run `02_describe.R` to generate tables and figures 
5. Run `02_model.R` to generate model result
6. Render the presentation with Quarto  

Following these steps will reproduce all outputs shown in the **"Simple, Useful R Tips — Live Demo"** presentation.
