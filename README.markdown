## Use

### Creating source files

Any file (or directory) in this top-level directory which matches the shell
glob `_*` will be linked into `${HOME}` as a symbolic link with the first `_`
replaced with a `.`

For example:

    _bashrc

is linked to from

    ${HOME}/.bashrc


### Installing source files

Installation  of the dot files to `${HOME}` is as simple as running:

```console
./install.sh
```

in this top-level directory.


## Requirements

* `bash`
