# include.bash_profile
umask 077

export PATH=$PATH:$HOME/my.local/bin
export LD_LIBRARY_PATH=$HOME/my.local/lib

# Need to export this:
export JULIAROOT='?'                                # set this below!
export C_INCLUDES=""                                # -I...
export C_LIBS=""                                    # -L...
export GCC="gcc"

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

    GCC=gcc
    JULIAROOT=/usr/local/share/julia/
    C_INCLUDES=-I$HOME/my.local/include
    C_LIBS=-L$HOME/my.local/lib

elif [[ $MYHOSTNAME =~ AWS.* ]] ;
then

    if [[ "$USER" == "ec2-user" ]] ;
    then
       sudo swapon /swapfile
       sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c1ce554.efs.eu-central-1.amazonaws.com:/ /mnt/ketita
    fi

    PATH=$PATH:/mnt/ketita/bin
    LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/mnt/ketita/lib
    JULIAROOT=/mnt/ketita/share/julia/
    PATH=$PATH:$JULIAROOT/bin

    C_INCLUDES=-I/mnt/ketita/include
    C_LIBS=-L/mnt/ketita/lib

    if [[ "$MYHOSTNAME" == "AWSu" ]] ;
    then

        GCC=gcc-9

    else
        echo "Value of MYHOSTNAME not recognized.  SETUP INCOMPLETE!!"
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

        C_INCLUDES=-I$HOME/my.local/include
        C_LIBS=-L$HOME/my.local/lib

        GCC=gcc

    else
        echo "Value MYHOSTNAME=$MYHOSTNAME not recognized.  SETUP INCOMPLETE!!"
    fi


else
    echo "Value of MYHOSTNAME not recognized.  SETUP INCOMPLETE!!"
fi
