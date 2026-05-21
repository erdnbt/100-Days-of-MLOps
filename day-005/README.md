# Day 5: Create a Makefile for ML Workflow Automation

## Task Overview

The xFusionCorp Industries ML team uses a Makefile to orchestrate common tasks—data processing, training, testing, and cleanup. A draft `Makefile` exists at `/root/code/fraud-detection/Makefile`, but `make all` does not complete successfully. Bring the Makefile in line with the team's standard.

1. Change into `/root/code/fraud-detection/` and run `make all` to observe the current failure.
    
2. The corrected Makefile must declare the following six targets and behaviour:
    
    - `setup` – Creates a virtual environment at `mlops-venv/` and installs dependencies from `requirements.txt`;
    - `data` – Runs `python src/data/process_data.py`;
    - `train` – Runs `python src/models/train.py`;
    - `test` – Runs `pytest tests/`;
    - `clean` – Recursively removes every `__pycache__` directory, removes `.pytest_cache`, and clears the contents of `models/`;
    - `all` – Runs `setup`, `data`, `train`, and `test` in that order.
3. All six target names must be declared as `.PHONY` so that Make never confuses them with files of the same name.
    
4. After your changes, `make all` must complete without error.
    

Makefile recipes must be indented with a real tab character, not spaces. Make rejects any recipe that is not tab-indented.

## Solution

### 1. run `make all`

```bash
root@controlplane ~/code ➜  cd fraud-detection/
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  make all
Makefile:7: *** missing separator.  Stop.
```

Error says: Line 7 is missing separator... 

#### Check current Makefile

```
# fraud-detection Makefile

setup:
	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt

data:
    python src/data/process_data.py

train:
	python src/models/train.py

test:
	pytest tests/

clean:
	rm -rf __pycache__

all: setup train test
```

Line 7 has spaces, not tabs.


#### Fix spaces and run again

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ✖ make all
python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt
Collecting scikit-learn (from -r requirements.txt (line 1))
...
================================================== 1 passed in 0.05s ===================================================
```

### 2. Update make file. 

```
# fraud-detection Makefile

.PHONY: setup data train test clean all

setup:
	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt

data:
	python src/data/process_data.py

train:
	python src/models/train.py

test:
	pytest tests/

clean:
	rm -rf __pycache__

all: setup data train test

```

## Verify

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  make all
python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt
Requirement already satisfied: scikit-learn in ./mlops-venv/lib/python3.12/site-packages (from -r requirements.txt (line 1)) (1.8.0)
....
.2.1->google-auth~=2.0->databricks-sdk<1,>=0.20.0->mlflow-skinny==3.12.0->mlflow->-r requirements.txt (line 4)) (0.6.3)
python src/data/process_data.py
python src/models/train.py
pytest tests/
================================================= test session starts ==================================================
platform linux -- Python 3.12.3, pytest-9.0.3, pluggy-1.6.0
rootdir: /root/code/fraud-detection
plugins: hydra-core-1.3.2, Faker-40.15.0, typeguard-4.5.1, testinfra-10.2.2, anyio-4.13.0
collected 1 item                                                                                                       

tests/test_smoke.py .                                                                                            [100%]

================================================== 1 passed in 0.05s ===================================================

```

> The 'clean' target must recursively remove every __pycache__ directory. Use: find . -type d -name __pycache__ -exec rm -rf {} +

Ok, I have to update `clean` recipe in Makefile.

### Updated Makefile 1:

```
# fraud-detection Makefile

.PHONY: setup data train test clean all

setup:
	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt

data:
	python src/data/process_data.py

train:
	python src/models/train.py

test:
	pytest tests/

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +

all: setup data train test
```

> The 'clean' target must also remove .pytest_cache

### Updated Makefile 2:

```
# fraud-detection Makefile

.PHONY: setup data train test clean all

setup:
	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt

data:
	python src/data/process_data.py

train:
	python src/models/train.py

test:
	pytest tests/

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
	rm -rf .pytest_cache

all: setup data train test
```

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  make clean
find . -type d -name __pycache__ -exec rm -rf {} +
rm -rf .pytest_cache

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜ 
```

> The 'clean' target must also clear the contents of the models/ directory

### Updated Makefile 3:

```
# fraud-detection Makefile

.PHONY: setup data train test clean all

setup:
	python3 -m venv mlops-venv && mlops-venv/bin/pip install -r requirements.txt

data:
	python src/data/process_data.py

train:
	python src/models/train.py

test:
	pytest tests/

clean:
	find . -type d -name __pycache__ -exec rm -rf {} +
	rm -rf .pytest_cache
    rm -rf models/*

all: setup data train test
```

## Gotchas / Lessons

1. A phony target is one that is not really the name of a file; rather it is just a name for a recipe to be executed when you make an explicit request. There are two reasons to use a phony target: to avoid a conflict with a file of the same name, and to improve performance.

2. The `__pycache__` directories are automatically created by Python inside every folder where a Python file is executed or imported.

## References

https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html

