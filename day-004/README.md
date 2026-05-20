# Day 4: Create a Standard ML Project Structure

## Task Overview

A colleague has started a new ML project at `/root/code/fraud-detection/`, but the layout does not match the xFusionCorp Industries standard. Bring the project in line with the team's conventions.


1. Inspect the existing project at `/root/code/fraud-detection/`.
    
2. The final layout must match the tree below exactly:

```bash
fraud-detection/ 
├── data/ 
│ ├── raw/ 
│ └── processed/ 
├── models/ 
├── notebooks/ 
├── src/ 
│ ├── data/ 
│ ├── features/ 
│ ├── models/ 
│ └── utils/ 
├── tests/ 
├── configs/ 
├── requirements.txt 
└── README.md
```

3. Every subdirectory under `src/` must contain an `__init__.py` file so that Python recognises it as a package.
    
4. `requirements.txt` must list the following dependencies, one per line: `scikit-learn`, `pandas`, `numpy`, and `mlflow`. The canonical PyPI name for the scikit-learn package is `scikit-learn`.
    
5. `README.md` must begin with the heading `# fraud-detection`.
    
6. Review the existing project and correct everything that does not match the requirements above.

## Solution

### 1. Create missing directories

```bash
cd fraud-detection/
mkdir -p data/{raw,processed}
mkdir {tests,configs}
```

### 2. Rename folder names

```bash
cd src/
mv feature features
mv model models
mv util utils
```

### 3. Change a title name in `README.md`

```bash
vim README.md

# Fraud --> # fraud-detection
```

### 4. Fix the packages in `requirements.txt`

```
scikit-learn
pandas
numpy
mlflow
```

## Verify

## Gotchas / Lessons

## References
