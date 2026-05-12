# Day 1: Create a Python Virtual Environment for ML

## Task Overview

The xFusionCorp Industries data science team needs a standardised Python environment for their new ML project. Set up a virtual environment with the required ML libraries on the `controlplane` host.

1. Create a Python virtual environment named `ml-env` under `/root/code/` using `python3 -m venv`.   
2. Activate the environment and install the following packages: `numpy`, `pandas`, `scikit-learn`, and `matplotlib`.
3. Generate a `requirements.txt` file using `pip freeze` and save it at `/root/code/requirements.txt`.

## Solutions

### 1. Create a Python virtual environment

Before you start, check your environment:


- Who are you? make sure you're `root` (or whoever owns `/root/code/`).
- Where are you? — the task requires the venv under `/root/code/`, so `cd` there first.
- Which Python? `which python3` and `python3 --version` — confirm Python 3 is available.
- Is `venv` installed? On Debian/Ubuntu, `python3-venv` is a separate package; if missing, `python3 -m venv` will fail with a hint to run `apt install python3-venv`. RHEL-family ships it with `python3` already.


```bash
whoami
pwd
cd /root/code
which python3
python3 --version
python3 -m venv ml-env
```

### 2. Activate the environment and install the packages

```bash
# check which SHELL
which $SHELL

# activate venv
source ml-env/bin/activate # or `. ml-env/bin/activate`

# install packages
which pip
pip install numpy pandas scikit-learn matplotlib
```

### 3. Generate a `requirements.txt`

```bash
pip freeze > requirements.txt
```

## Verify

```bash
# check if venv is actually active
which pip
which python

# check all the packages are in the list
pip list

# check the list
cat requirements.txt
```

## Gotchas / Lessons

## References
