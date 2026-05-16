# Day 2: Set Up and Configure Jupyter Notebook Server

## Task Overview

A teammate has configured a JupyterLab server for the xFusionCorp Industries data science team, but the server does not behave correctly. Inspect the configuration, diagnose the issues, and start the server.

1. JupyterLab is already installed in the virtual environment at /root/code/ml-env/. The team's configuration file is at /root/code/jupyter_lab_config.py and is visible in the file explorer.

2. When JupyterLab is started, the Jupyter UI button at the top of the lab must open the notebook interface.

3. For this to work, the running server must meet the following requirements:

    - it listens on port 8888;
    - it binds on 0.0.0.0 (the lab proxy cannot reach a server that is only bound on 127.0.0.1);
    - the notebook root directory is /root/notebooks/, and that directory exists on disk.

4. Open the configuration file, identify every setting that prevents the requirements above from being met, and correct it. Create any missing directories.

5. Start JupyterLab from the virtual environment using the corrected configuration:

    ```bash
    source /root/code/ml-env/bin/activate
    jupyter lab --config=/root/code/jupyter_lab_config.py --allow-root --no-browser &
    ```

Make sure JupyterLab is running before using the button at the top of the lab.

## Solution

### 1. Check environments

1. Click the `Jupyter UI` button, it give 503 error --> it is okay since it have not run any Jupyter Server yet
2. Check config file

```bash
# Jupyter configuration file for the xFusionCorp Industries data science team
 
# --- xFusionCorp team overrides (review before starting the server) ---
c.ServerApp.token = ''
c.ServerApp.password = ''
c.ServerApp.disable_check_xsrf = True
c.ServerApp.notebook_dir = '/root/wrong-path'
c.ServerApp.port = 8000
c.ServerApp.ip = '1.1.1.1'
```

### 2. Fix the config file

1. `c.ServerApp.notebook_dir = '/root/wrong-path'` --> `c.ServerApp.notebook_dir = '/root/notebooks'`
2. `c.ServerApp.port = 8000` --> `c.ServerApp.port = 8888`
3. `c.ServerApp.ip = '1.1.1.1'` --> `c.ServerApp.ip = '0.0.0.0'`

4. First Run

    ```bash
    source /root/code/ml-env/bin/activate
    jupyter lab --config=/root/code/jupyter_lab_config.py --allow-root --no-browser &
    ```

    log shows:

    ```log
    [W 2026-05-15 17:44:06.845 ServerApp] notebook_dir is deprecated, use root_dir
    [C 2026-05-15 17:44:06.845 ServerApp] Bad config encountered during initialization: No such directory: ''/root/notebooks''
    ```

5. Let's fix it. Create dir

    ```bash
    mkdir -p /root/notebooks

    # then run to check
    source /root/code/ml-env/bin/activate
    jupyter lab --config=/root/code/jupyter_lab_config.py --allow-root --no-browser &
    ```

    log shows:

    ```bash
    [W 2026-05-15 17:45:45.321 ServerApp] notebook | error adding extension (enabled: True): The module 'notebook' could not be found (No module named 'notebook'). Are you sure the extension is installed?
        Traceback (most recent call last):
        File "/root/code/ml-env/lib/python3.12/site-packages/jupyter_server/extension/manager.py", line 365, in add_extension
            extpkg = ExtensionPackage(name=extension_name, enabled=enabled)
                    ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        File "/root/code/ml-env/lib/python3.12/site-packages/jupyter_server/extension/manager.py", line 219, in __init__
            self._load_metadata()
        File "/root/code/ml-env/lib/python3.12/site-packages/jupyter_server/extension/manager.py", line 234, in _load_metadata
            raise ExtensionModuleNotFound(msg) from None
        jupyter_server.extension.utils.ExtensionModuleNotFound: The module 'notebook' could not be found (No module named 'notebook'). Are you sure the extension is installed?
    ```

6. We need to install python package `notebook`

    ```bash
    # check which python environment
    root@controlplane ~/code via 🐍 v3.12.3 (ml-env) ➜  which pip 
    /root/code/ml-env/bin/pip

    # install package
    root@controlplane ~/code via 🐍 v3.12.3 (ml-env) ➜  pip install notebook
    ...
    Installing collected packages: notebook
    Successfully installed notebook-7.5.6

    # check if it is installed
    root@controlplane ~/code via 🐍 v3.12.3 (ml-env) ➜  pip list | grep notebook
    notebook                  7.5.6
    notebook_shim             0.2.4

    # run to check
    source /root/code/ml-env/bin/activate
    jupyter lab --config=/root/code/jupyter_lab_config.py --allow-root --no-browser &
    ```

    ok this time, I see no error! 

## Verify

- Clicking the Jupyter UI button at the top of the lab should open the notebook interface.

## Gotchas / Lessons

- There were two deprecation warnings. Changing these variables will fail the KodeKloud challenge, so keep them as they are.

    ```bash
    ServerApp.token config is deprecated in 2.0. Use IdentityProvider.token.
    notebook_dir is deprecated, use root_dir
    ```

## References

- https://jupyter-server.readthedocs.io/en/latest/other/full-config.html