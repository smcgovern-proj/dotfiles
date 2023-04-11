"\nlet-env ASDF_NU_DIR = ($env.HOME | path join '.asdf')\n source " + ($env.HOME | path join '.asdf/asdf.nu') | save --append $nu.config-path
