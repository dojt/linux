# include.bash_profile
umask 077

export PATH=$PATH:$HOME/my.local/bin:$HOME/bin
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

    export JULIAROOT=/usr/local/share/julia/
    export GCC=gcc

elif [[ $MYHOSTNAME =~ AWS.* ]] ;
then

    sudo swapon /swapfile

    sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c1ce554.efs.eu-central-1.amazonaws.com:/ /mnt/ketita

    PATH=$PATH:/mnt/ketita/sophus/bin
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/ketita/sophus/lib

    if [[ "$MYHOSTNAME" == "AWSr" ]] ;
    then

        export GCC=gcc
	export JULIAROOT=/usr/local/share/julia/

        PATH=$PATH:$JULIAROOT/bin

	echo 'Remember to `scl enable gcc-toolset-9 bash`'

    else
        export GCC=gcc-9
        export JULIAROOT=/opt/julia/

        PATH=$PATH:$JULIAROOT/bin

    fi

elif [[ $MYHOSTNAME =~ Chr.* ]] ;
then

    # Julia
    export JULIAROOT=$HOME/my.local/share/julia
    PATH=$PATH:$JULIAROOT/bin

    if [[ "$MYHOSTNAME" == "ChrPXL" ]] ;
    then
        echo > /dev/null
        # Ketita stuff
        # not needed

        # current GCC
        # not needed

    elif [[ "$MYHOSTNAME" == "ChrAcr" ]] ;
    then

        # sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c1ce554.efs.eu-central-1.amazonaws.com:/ /mnt/ketita

        # Ketita stuff
        PATH=$PATH:/mnt/ketita/sophus/bin
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/ketita/sophus/lib

        # current GCC
        export GCC=gcc
#        export GCC=gcc-9

        # Julia
#	export JULIAROOT=/usr/local/share/julia/
        export JULIAROOT=`which julia`/../
        PATH=$PATH:$JULIAROOT/bin

    else
        echo "Value MYHOSTNAME=$MYHOSTNAME not recognized.  SETUP INCOMPLETE!!"

    fi


else
    echo "Value of MYHOSTNAME not recognized.  SETUP INCOMPLETE!!"
fi

