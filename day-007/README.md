# Day 7: Package an ML Project as Installable Python Package

## Task Overview

The xFusionCorp Industries deployment team needs the fraud-detection model code packaged as an installable Python distribution. A draft pyproject.toml exists at /root/code/fraud-detection/, but it does not build a wheel that meets the team's standard. Correct the file and produce a compliant package.


The project at /root/code/fraud-detection/ already contains the source code under src/fraud_detection/. The Python files are complete—you do not need to modify any of them.

The corrected pyproject.toml must satisfy every one of the following:

it declares a [build-system] section with requires = ["setuptools>=61.0", "wheel"] and build-backend = "setuptools.build_meta";
name is fraud_detection (the distribution name must match the module path under src/);
version is 0.1.0;
requires-python is >=3.10;
dependencies is ["scikit-learn", "pandas", "numpy"].
Review the existing pyproject.toml and correct everything that does not match the requirements above.

Build the package from the project directory:

   cd /root/code/fraud-detection
   python3 -m build

The build must produce a wheel named fraud_detection-0.1.0-*.whl under dist/.
The build package is already installed. Use python3 rather than python.

## Solution

### Current pyproject.toml file

```toml
[project]
name = "fraud-detection"
version = "0.0.1"
description = "Fraud detection model for xFusionCorp Industries"
requires-python = ">=3.8"
dependencies = []

[tool.setuptools.packages.find]
where = ["src"]
```

### Fixed version

```toml
[project]
name = "fraud_detection"
version = "0.1.0"
description = "Fraud detection model for xFusionCorp Industries"
requires-python = ">=3.10"
dependencies = ["scikit-learn", "pandas", "numpy"]

[tool.setuptools.packages.find]
where = ["src"]

[build-system]
requires = ["setuptools>=61.0", "wheel"]
build-backend = "setuptools.build_meta"
```

### Run

```bash
root@controlplane ~/code ✖    cd /root/code/fraud-detection
   python3 -m build
* Creating isolated environment: venv+pip...
* Installing packages in isolated environment:
  - setuptools>=61.0
  - wheel
* Getting build dependencies for sdist...
running egg_info
creating src/fraud_detection.egg-info
writing src/fraud_detection.egg-info/PKG-INFO
writing dependency_links to src/fraud_detection.egg-info/dependency_links.txt
writing requirements to src/fraud_detection.egg-info/requires.txt
writing top-level names to src/fraud_detection.egg-info/top_level.txt
writing manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
reading manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
writing manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
* Building sdist...
running sdist
running egg_info
writing src/fraud_detection.egg-info/PKG-INFO
writing dependency_links to src/fraud_detection.egg-info/dependency_links.txt
writing requirements to src/fraud_detection.egg-info/requires.txt
writing top-level names to src/fraud_detection.egg-info/top_level.txt
reading manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
writing manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
warning: sdist: standard file not found: should have one of README, README.rst, README.txt, README.md

running check
creating fraud_detection-0.1.0
creating fraud_detection-0.1.0/src/fraud_detection
creating fraud_detection-0.1.0/src/fraud_detection.egg-info
copying files to fraud_detection-0.1.0...
copying pyproject.toml -> fraud_detection-0.1.0
copying src/fraud_detection/__init__.py -> fraud_detection-0.1.0/src/fraud_detection
copying src/fraud_detection/predict.py -> fraud_detection-0.1.0/src/fraud_detection
copying src/fraud_detection.egg-info/PKG-INFO -> fraud_detection-0.1.0/src/fraud_detection.egg-info
copying src/fraud_detection.egg-info/SOURCES.txt -> fraud_detection-0.1.0/src/fraud_detection.egg-info
copying src/fraud_detection.egg-info/dependency_links.txt -> fraud_detection-0.1.0/src/fraud_detection.egg-info
copying src/fraud_detection.egg-info/requires.txt -> fraud_detection-0.1.0/src/fraud_detection.egg-info
copying src/fraud_detection.egg-info/top_level.txt -> fraud_detection-0.1.0/src/fraud_detection.egg-info
copying src/fraud_detection.egg-info/SOURCES.txt -> fraud_detection-0.1.0/src/fraud_detection.egg-info
Writing fraud_detection-0.1.0/setup.cfg
Creating tar archive
removing 'fraud_detection-0.1.0' (and everything under it)
* Building wheel from sdist
* Creating isolated environment: venv+pip...
* Installing packages in isolated environment:
  - setuptools>=61.0
  - wheel
* Getting build dependencies for wheel...
running egg_info
writing src/fraud_detection.egg-info/PKG-INFO
writing dependency_links to src/fraud_detection.egg-info/dependency_links.txt
writing requirements to src/fraud_detection.egg-info/requires.txt
writing top-level names to src/fraud_detection.egg-info/top_level.txt
reading manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
writing manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
* Building wheel...
running bdist_wheel
running build
running build_py
creating build/lib/fraud_detection
copying src/fraud_detection/predict.py -> build/lib/fraud_detection
copying src/fraud_detection/__init__.py -> build/lib/fraud_detection
running egg_info
writing src/fraud_detection.egg-info/PKG-INFO
writing dependency_links to src/fraud_detection.egg-info/dependency_links.txt
writing requirements to src/fraud_detection.egg-info/requires.txt
writing top-level names to src/fraud_detection.egg-info/top_level.txt
reading manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
writing manifest file 'src/fraud_detection.egg-info/SOURCES.txt'
installing to build/bdist.linux-x86_64/wheel
running install
running install_lib
creating build/bdist.linux-x86_64/wheel
creating build/bdist.linux-x86_64/wheel/fraud_detection
copying build/lib/fraud_detection/predict.py -> build/bdist.linux-x86_64/wheel/./fraud_detection
copying build/lib/fraud_detection/__init__.py -> build/bdist.linux-x86_64/wheel/./fraud_detection
running install_egg_info
Copying src/fraud_detection.egg-info to build/bdist.linux-x86_64/wheel/./fraud_detection-0.1.0-py3.12.egg-info
running install_scripts
creating build/bdist.linux-x86_64/wheel/fraud_detection-0.1.0.dist-info/WHEEL
creating '/root/code/fraud-detection/dist/.tmp-m5mndugp/fraud_detection-0.1.0-py3-none-any.whl' and adding 'build/bdist.linux-x86_64/wheel' to it
adding 'fraud_detection/__init__.py'
adding 'fraud_detection/predict.py'
adding 'fraud_detection-0.1.0.dist-info/METADATA'
adding 'fraud_detection-0.1.0.dist-info/WHEEL'
adding 'fraud_detection-0.1.0.dist-info/top_level.txt'
adding 'fraud_detection-0.1.0.dist-info/RECORD'
removing build/bdist.linux-x86_64/wheel
Successfully built fraud_detection-0.1.0.tar.gz and fraud_detection-0.1.0-py3-none-any.whl

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  python --version
Python 3.12.3

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  python3 --version
Python 3.12.3

```

## Verify

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ✖ ls -lah dist/
total 16K
drwxr-xr-x 2 root root 4.0K May 28 15:27 .
drwxr-xr-x 4 root root 4.0K May 28 15:27 ..
-rw-r--r-- 1 root root 1.9K May 28 15:27 fraud_detection-0.1.0-py3-none-any.whl
-rw-r--r-- 1 root root 1.4K May 28 15:27 fraud_detection-0.1.0.tar.gz
```

## Gotchas / Lessons

## References
