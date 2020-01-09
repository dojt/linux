# LINUX startup scripts

## Setup

1. Clone this repository into `~/linux`
2. Modify your `.bashrc`, `.bash_profile`, and `.bash_logout` as below.

#### Bashrc
The top lines of the file `.bashrc` must be this:

    umask 077
    export MYHOSTNAME="HPC"
    # export MYHOSTNAME="AWS"
    # export MYHOSTNAME="blah"

Among `HPC`, `AWS` choose the one that applies; if you're on a different system, give it an arbitrary short name.

The bottom of the file must be

    umask 077
    . linux/include.bashrc
    umask 077
    . linux/bash_aliases
    umask 077

Note the exemplary paranois about the umask.

**The behaviour or the sourced (`.`) files differs depending on the value of `MYHOSTNAME`.**

#### Bash_profile
The top line of the `.bash_profile` must be this:

    umask 077

The bottom of the file must be

    umask 077
    . linux/include.bash_profile
    umask 077

Check that `.bashrc` is sourced somewhere between top and bottom.  That's the default on most systems, and is necessary for the stuff in this repository to work.

#### Bash_logout
Topf of the file `.bash_logout`:

    umask 077
    . linux/include.bash_logout
