# Day 8: Configure Pre-Commit Hooks for ML Repository

## Task Overview

The xFusionCorp Industries ML team enforces code quality on every commit via pre-commit. A draft .pre-commit-config.yaml exists in the git repository at /root/code/fraud-detection/, but it does not match the team's standard and pre-commit run --all-files fails against it. Correct the configuration.


1. A git repository already exists at /root/code/fraud-detection/ with .pre-commit-config.yaml and process.py already tracked. pre-commit is installed system-wide.

2. The corrected configuration must declare the following five hooks so that pre-commit run --all-files executes every one of them:

    - trailing-whitespace, end-of-file-fixer, and check-yaml – All three sourced from the pre-commit/pre-commit-hooks repository, pinned to a current release;
    - ruff – Sourced from the astral-sh/ruff-pre-commit repository, pinned to a current release;
    - black – Sourced from the psf/black-pre-commit-mirror repository, pinned to a current release.

3. Every repository entry in the configuration must include a rev: field.

4. Review the existing .pre-commit-config.yaml and correct everything that prevents the hooks above from running.

5. Once the configuration is correct, register the hooks with git and run them against the tracked files:

    ```bash
    pre-commit install
    pre-commit run --all-files
    ```

Tip: pre-commit autoupdate queries each referenced repository and rewrites the rev: pins to the latest released tag. This is the standard way to discover current versions without looking them up by hand.

## Solution

### Lets check errors

```bash
root@controlplane ~/code ✖ cd fraud-detection/

root@controlplane fraud-detection on  main via 🐍 v3.12.3 ➜  ls -lah
total 20K
drwxr-xr-x 3 root root 4.0K May 29 15:18 .
drwxr-xr-x 3 root root 4.0K May 29 15:18 ..
drwxr-xr-x 8 root root 4.0K May 29 15:18 .git
-rw-r--r-- 1 root root  372 May 29 15:18 .pre-commit-config.yaml
-rw-r--r-- 1 root root   36 May 29 15:18 process.py

root@controlplane fraud-detection on  main via 🐍 v3.12.3 ➜     pre-commit install
   pre-commit run --all-files
pre-commit installed at .git/hooks/pre-commit
An error has occurred: InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev
Check the log at /root/.cache/pre-commit/pre-commit.log

root@controlplane fraud-detection on  main via 🐍 v3.12.3 ✖ cat /root/.cache/pre-commit/pre-commit.log
### version information


pre-commit version: 4.6.0
git --version: git version 2.43.0
sys.version:
    3.12.3 (main, Mar 23 2026, 19:04:32) [GCC 13.3.0]
sys.executable: /usr/bin/python3
os.name: posix
sys.platform: linux


### error information

An error has occurred: InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev

Traceback (most recent call last):
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/error_handler.py", line 73, in error_handler
    yield
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/main.py", line 429, in main
    return run(args.config, store, args)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/commands/run.py", line 423, in run
    config = load_config(config_file)
             ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 433, in load_from_filename
    with reraise_as(exc_tp):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 45, in reraise_as
    raise tp(e).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 42, in reraise_as
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 437, in load_from_filename
    with validate_context(f'File {display_filename}'):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 449, in load_from_filename
    validate(data, schema)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 412, in validate
    schema.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 244, in check
    with validate_context(context):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 246, in check
    item.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 75, in _check_required
    _check_optional(self, dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 55, in _check_optional
    with validate_context(f'At key: {self.key}'):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 56, in _check_optional
    self.check_fn(dct[self.key])
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 81, in check_fn
    validate(val, self.schema)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 412, in validate
    schema.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 308, in check
    validate(val, self.of)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 412, in validate
    schema.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 244, in check
    with validate_context(context):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 246, in check
    item.check(v)
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/clientlib.py", line 296, in check
    super().check(dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 108, in _check_conditional
    inner(self, dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 74, in _check_required
    _require_key(self, dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 70, in _require_key
    raise ValidationError(f'Missing required key: {self.key}')
pre_commit.clientlib.InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev
```

### check `.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check_yaml

  - repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: v0.1.0
    hooks:
      - id: ruff-lint

  - repo: https://github.com/psf/black-pre-commit-mirror
    hooks:
      - id: black
```

### First fix. 

#### Error:

```
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev
```

so added rev in `.pre-commit-config.yaml` file

```
  - repo: https://github.com/psf/black-pre-commit-mirror
    rev: 26.5.1
    hooks:
      - id: black
```

to check:

```bash
root@controlplane fraud-detection on  main via 🐍 v3.12.3 ➜  pre-commit install
pre-commit installed at .git/hooks/pre-commit

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  pre-commit run --all-files
[INFO] Initializing environment for https://github.com/pre-commit/pre-commit-hooks.
[WARNING] repo `https://github.com/pre-commit/pre-commit-hooks` uses deprecated stage names (commit, push) which will be removed in a future version.  Hint: often `pre-commit autoupdate --repo https://github.com/pre-commit/pre-commit-hooks` will fix this.  if it does not -- consider reporting an issue to that repo.
[ERROR] `check_yaml` is not present in repository https://github.com/pre-commit/pre-commit-hooks.  Typo? Perhaps it is introduced in a newer version?  Often `pre-commit autoupdate` fixes this.
```

### Second fix:

#### Error

```
[ERROR] `check_yaml`
```

#### Fix. 

checking the github. 
https://github.com/pre-commit/pre-commit-hooks/tree/v2.3.0/pre_commit_hooks

it probably tooks from python file name. but user-faced hook id is `check-yaml`

check it in the README file 
https://github.com/pre-commit/pre-commit-hooks/tree/v2.3.0


#### To run to check

```bash
root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ pre-commit run --all-files
[INFO] Initializing environment for https://github.com/charliermarsh/ruff-pre-commit.
[ERROR] `ruff-lint` is not present in repository https://github.com/charliermarsh/ruff-pre-commit.  Typo? Perhaps it is introduced in a newer version?  Often `pre-commit autoupdate` fixes this.

```

### Third fix:

#### To check GitHub for confirming.

https://github.com/astral-sh/ruff-pre-commit/tree/v0.1.0

sing Ruff with pre-commit
Add this to your .pre-commit-config.yaml:

- repo: https://github.com/astral-sh/ruff-pre-commit
  # Ruff version.
  rev: v0.1.0
  hooks:
    - id: ruff

#### Fix

```
  - repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: v0.1.0
    hooks:
      - id: ruff
```

#### To run to confirm that it is fixed

```bash
root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ pre-commit run --all-files
[INFO] Initializing environment for https://github.com/psf/black-pre-commit-mirror.
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/charliermarsh/ruff-pre-commit.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/psf/black-pre-commit-mirror.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
Trim Trailing Whitespace.................................................Failed
- hook id: trailing-whitespace
- exit code: 1
- files were modified by this hook

Fixing process.py

Fix End of Files.........................................................Passed
Check Yaml...............................................................Passed
ruff.....................................................................Passed
black....................................................................Passed
```


--> look fine. 

### Final `.pre-commit-config.yaml`

```yaml
 repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v2.3.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

  - repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: v0.1.0
    hooks:
      - id: ruff

  - repo: https://github.com/psf/black-pre-commit-mirror
    rev: 26.5.1
    hooks:
      - id: black
```

### To just play around. 

lets run 

```bash
pre-commit autoupdate

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ pre-commit autoupdate
[https://github.com/pre-commit/pre-commit-hooks] updating v2.3.0 -> v6.0.0
[https://github.com/charliermarsh/ruff-pre-commit] updating v0.1.0 -> v0.15.15
[https://github.com/psf/black-pre-commit-mirror] already up to date!
```


```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v6.0.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

  - repo: https://github.com/charliermarsh/ruff-pre-commit
    rev: v0.15.15
    hooks:
      - id: ruff

  - repo: https://github.com/psf/black-pre-commit-mirror
    rev: 26.5.1
    hooks:
      - id: black
```

## Verify

to confirm it worked:

```bash
root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  pre-commit run --all-files
[INFO] Initializing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Initializing environment for https://github.com/charliermarsh/ruff-pre-commit.
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/charliermarsh/ruff-pre-commit.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
trim trailing whitespace.................................................Passed
fix end of files.........................................................Passed
check yaml...............................................................Passed
ruff (legacy alias)......................................................Passed
black....................................................................Passed
```


Check. 

```
The ruff-pre-commit URL must reference the astral-sh organisation — found 'https://github.com/charliermarsh/ruff-pre-commit'
```

Since I updated pre-commit config file, the new version of ruff-pre-commit GitHub repo url is changed. 

https://github.com/astral-sh/ruff-pre-commit.git

I can fix that. So rerun lab!! do the autoupdate.

### Rerun lab

```bash
root@controlplane ~/code ✖ cd fraud-detection/

root@controlplane fraud-detection on  main via 🐍 v3.12.3 ➜     pre-commit install
   pre-commit run --all-files
pre-commit installed at .git/hooks/pre-commit
An error has occurred: InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev
Check the log at /root/.cache/pre-commit/pre-commit.log

root@controlplane fraud-detection on  main via 🐍 v3.12.3 ✖ pre-commit run --all-files
An error has occurred: InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev
Check the log at /root/.cache/pre-commit/pre-commit.log

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ less /root/.cache/pre-commit/pre-commit.log
bash: less: command not found

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ cat /root/.cache/pre-commit/pre-commit.log
### version information


pre-commit version: 4.6.0
git --version: git version 2.43.0
sys.version:
    3.12.3 (main, Mar 23 2026, 19:04:32) [GCC 13.3.0]
sys.executable: /usr/bin/python3
os.name: posix
sys.platform: linux


### error information


An error has occurred: InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev



Traceback (most recent call last):
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/error_handler.py", line 73, in error_handler
    yield
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/main.py", line 429, in main
    return run(args.config, store, args)
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/commands/run.py", line 423, in run
    config = load_config(config_file)
             ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 433, in load_from_filename
    with reraise_as(exc_tp):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 45, in reraise_as
    raise tp(e).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 42, in reraise_as
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 437, in load_from_filename
    with validate_context(f'File {display_filename}'):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 449, in load_from_filename
    validate(data, schema)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 412, in validate
    schema.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 244, in check
    with validate_context(context):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 246, in check
    item.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 75, in _check_required
    _check_optional(self, dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 55, in _check_optional
    with validate_context(f'At key: {self.key}'):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 56, in _check_optional
    self.check_fn(dct[self.key])
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 81, in check_fn
    validate(val, self.schema)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 412, in validate
    schema.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 308, in check
    validate(val, self.of)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 412, in validate
    schema.check(v)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 244, in check
    with validate_context(context):
  File "/usr/lib/python3.12/contextlib.py", line 158, in __exit__
    self.gen.throw(value)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 36, in validate_context
    raise ValidationError(e, ctx=msg).with_traceback(tb) from None
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 33, in validate_context
    yield
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 246, in check
    item.check(v)
  File "/usr/local/lib/python3.12/dist-packages/pre_commit/clientlib.py", line 296, in check
    super().check(dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 108, in _check_conditional
    inner(self, dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 74, in _check_required
    _require_key(self, dct)
  File "/usr/local/lib/python3.12/dist-packages/cfgv.py", line 70, in _require_key
    raise ValidationError(f'Missing required key: {self.key}')
pre_commit.clientlib.InvalidConfigError: 
==> File .pre-commit-config.yaml
==> At Config()
==> At key: repos
==> At Repository(repo='https://github.com/psf/black-pre-commit-mirror')
=====> Missing required key: rev


root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  pre-commit run --all-files
[INFO] Initializing environment for https://github.com/pre-commit/pre-commit-hooks.
[WARNING] repo `https://github.com/pre-commit/pre-commit-hooks` uses deprecated stage names (commit, push) which will be removed in a future version.  Hint: often `pre-commit autoupdate --repo https://github.com/pre-commit/pre-commit-hooks` will fix this.  if it does not -- consider reporting an issue to that repo.
[INFO] Initializing environment for https://github.com/charliermarsh/ruff-pre-commit.
[ERROR] `ruff-lint` is not present in repository https://github.com/charliermarsh/ruff-pre-commit.  Typo? Perhaps it is introduced in a newer version?  Often `pre-commit autoupdate` fixes this.

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ pre-commit run --all-files
[INFO] Initializing environment for https://github.com/psf/black-pre-commit-mirror.
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/charliermarsh/ruff-pre-commit.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/psf/black-pre-commit-mirror.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
Trim Trailing Whitespace.................................................Failed
- hook id: trailing-whitespace
- exit code: 1
- files were modified by this hook

Fixing process.py

Fix End of Files.........................................................Passed
Check Yaml...............................................................Passed
ruff.....................................................................Passed
black....................................................................Passed

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ✖ pre-commit run --all-files
Trim Trailing Whitespace.................................................Passed
Fix End of Files.........................................................Passed
Check Yaml...............................................................Passed
ruff.....................................................................Passed
black....................................................................Passed

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  
```

### Now, autoupdate and change repo URL

```bash
root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  pre-commit autoupdate
[https://github.com/pre-commit/pre-commit-hooks] updating v2.3.0 -> v6.0.0
[https://github.com/charliermarsh/ruff-pre-commit] updating v0.1.0 -> v0.15.15
[https://github.com/psf/black-pre-commit-mirror] already up to date!

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  pre-commit run --all-files
[INFO] Initializing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Initializing environment for https://github.com/astral-sh/ruff-pre-commit.git.
[INFO] Installing environment for https://github.com/pre-commit/pre-commit-hooks.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
[INFO] Installing environment for https://github.com/astral-sh/ruff-pre-commit.git.
[INFO] Once installed this environment will be reused.
[INFO] This may take a few minutes...
trim trailing whitespace.................................................Passed
fix end of files.........................................................Passed
check yaml...............................................................Passed
ruff (legacy alias)......................................................Passed
black....................................................................Passed

root@controlplane fraud-detection on  main [!] via 🐍 v3.12.3 ➜  
```

#### Final `.pre-commit-config.yaml`

```yaml
repos:
  - repo: https://github.com/pre-commit/pre-commit-hooks
    rev: v6.0.0
    hooks:
      - id: trailing-whitespace
      - id: end-of-file-fixer
      - id: check-yaml

  - repo: https://github.com/astral-sh/ruff-pre-commit.git
    rev: v0.15.15
    hooks:
      - id: ruff

  - repo: https://github.com/psf/black-pre-commit-mirror
    rev: 26.5.1
    hooks:
      - id: black

```

## Gotchas / Lessons

## References
