# Custom exports
export VISUAL='/usr/bin/nvim'
export EDITOR='/usr/bin/nvim'

export GOPATH='/home/manoppermann/go'

export PATH="$PATH:/home/manoppermann/.cargo/bin"

# Added by Toolbox App
export PATH="$PATH:/home/manoppermann/.local/share/JetBrains/Toolbox/scripts"

# opam configuration
test -r /home/manoppermann/.opam/opam-init/init.sh && . /home/manoppermann/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

# mount google drive
if [[ -d ~/Documents/GoogleDrive ]] && which google-drive-ocamlfuse; then
  google-drive-ocamlfuse ~/Documents/GoogleDrive
fi

# enable open mpi module
if which module >/dev/null 2>/dev/null; then
    module load mpi/openmpi-x86_64
fi
