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

elif [[ $MYHOSTNAME =~ AWS.* ]] ;
then

    sudo mount -t nfs4 -o nfsvers=4.1,rsize=1048576,wsize=1048576,hard,timeo=600,retrans=2,noresvport fs-0c1ce554.efs.eu-central-1.amazonaws.com:/ /mnt/ketita

    export JULIAROOT=/opt/julia/
    export PATH=$PATH:$JULIAROOT/bin

    if [[ "$MYHOSTNAME" == "AWSr" ]] ;
    then
	export JULIAROOT=/usr/local/share/julia/
	echo 'Remember to `scl enable gcc-toolset-9 bash`'
    fi

else
    echo "Value of MYHOSTNAME not recognized.  SETUP INCOMPLETE!!"
fi

