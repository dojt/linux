# include.bash_profile
umask 077

export PATH=$PATH:$HOME/my.local/bin:$HOME/bin

export JULIAROOT=$HOME/my.local/share/julia

export LD_LIBRARY_PATH=$HOME/my.local/lib



if [[ "$MYHOSTNAME" == "HPC" ]] ;
then
    module add git
    umask 077
    module add gcc-9.1.0
    umask 077
    module add cuda/10.0
    umask 077
    module add mkl
    umask 077
elif [[ "$MYHOSTNAME" == "AWS" ]] ;
then
    echo 'Remember to `scl enable gcc-toolset-9 bash`'
fi

