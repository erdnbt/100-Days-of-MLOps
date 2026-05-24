# Day 6: Set Up Code Quality Tools for ML Code

## Task Overview

The xFusionCorp Industries ML team enforces code quality with ruff and black on every pull request. The project at /root/code/fraud-detection/ currently fails both tools. Make it pass them.


1. The project at /root/code/fraud-detection/ contains a pyproject.toml and sample sources under src/.

2. The corrected project must meet the following requirements:

    - ruff and black are both configured with a line length of 120.
    - ruff lint rule selection includes E, F, W, and I, and is declared under [tool.ruff.lint] – The schema required by ruff 0.1 and later.
    - Running ruff check src/ from the project directory exits with status 0.
    - Running black --check src/ from the project directory exits with status 0.

3. Review the existing configuration and source files, and correct everything that prevents the two commands above from exiting cleanly. ruff, black, and mypy are already installed.

## Solution

### Current toml file. 

```toml
[project]
name = "fraud-detection"
version = "0.1.0"

[tool.ruff]
line-length = 88
select = ["E", "F"]

[tool.black]
line-length = 100
```

#### Changes

```toml
[project]
name = "fraud-detection"
version = "0.1.0"

[tool.ruff]
line-length = 120

[tool.ruff.lint]
select = ["E", "F", "W", "I"]

[tool.black]
line-length = 120
```


### 

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  ruff check src/
I001 [*] Import block is un-sorted or un-formatted
 --> src/data/process_data.py:1:1
  |
1 | / import os
2 | | import pandas as pd
  | |___________________^
  |
help: Organize imports

F401 [*] `os` imported but unused
 --> src/data/process_data.py:1:8
  |
1 | import os
  |        ^^
2 | import pandas as pd
  |
help: Remove unused import: `os`

Found 2 errors.
[*] 2 fixable with the `--fix` option.

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ✖ which python3
/usr/bin/python3

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  which pip3
/usr/bin/pip3

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  pip3 list
```

--> 2 errors in src/data/process_data.py:

1. imported `os` package but didn't use it in the code.

    --> fix: delete a line or comment out. 

2. pandas package are not installed.

### Install `pandas`

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  pip3 install pandas
error: externally-managed-environment

× This environment is externally managed
╰─> To install Python packages system-wide, try apt install
    python3-xyz, where xyz is the package you are trying to
    install.
    
    If you wish to install a non-Debian-packaged Python package,
    create a virtual environment using python3 -m venv path/to/venv.
    Then use path/to/venv/bin/python and path/to/venv/bin/pip. Make
    sure you have python3-full installed.
    
    If you wish to install a non-Debian packaged Python application,
    it may be easiest to use pipx install xyz, which will manage a
    virtual environment for you. Make sure you have pipx installed.
    
    See /usr/share/doc/python3.12/README.venv for more information.

note: If you believe this is a mistake, please contact your Python installation or OS distribution provider. You can override this, at the risk of breaking your Python installation or OS, by passing --break-system-packages.
hint: See PEP 668 for the detailed specification.

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ✖ pip3 install pandas --break-system-packages

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  pip3 list | grep ruff
ruff                                         0.15.12

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  pip3 list | grep black
black                                        26.3.1

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  pip3 list | grep mypy
mypy                                         1.20.2
mypy_extensions                              1.1.0

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  pip3 list | grep pandas
pandas                                       2.3.3

```

## Verify

```bash
root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  ruff check src/
All checks passed!

root@controlplane ~/code/fraud-detection via 🐍 v3.12.3 ➜  black --check src/
All done! ✨ 🍰 ✨
5 files would be left unchanged.
```

## Gotchas / Lessons

## References
